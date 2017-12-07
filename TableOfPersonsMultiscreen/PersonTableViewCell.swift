//
//  PersonTableViewCell.swift
//  TableOfPersonsMultiscreen
//
//  Created by mobile consulting on 12/4/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import UIKit
import CoreData

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    var table: UITableView?
    
    private var _person: SWCharacter!
    var character: SWCharacter {
        get {return _person}
        set {
            _person = newValue
            newValue.assignCell(cell: self)
            loadCellData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _person = SWCharacter()
        table = self.superview as? UITableView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadCellData() {
        nameLabel.text = "\(_person.name)"
        ageLabel.text = "\(_person.birthYear)"
    }
}

class SWCharacter {
    var name: String = ""
    var height: String = ""
    var mass: String = ""
    var hairColor: String = ""
    var skinColor: String = ""
    var eyeColor: String = ""
    var birthYear: String = ""
    var gender: String = ""
    var homeworld: String = ""
    
    var cell: PersonTableViewCell?
    var url: String = ""
    let moc: NSManagedObjectContext?
    
    init(url: String, row: Int) {
        self.url = url
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            moc = appDelegate.persistentContainer.viewContext
        } else {
            print("Delegate init error")
            moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        }
        
        if let cdChar = getFromCoreData(url: url) {
            self.name = cdChar.value(forKey: "name") as! String
            self.height = cdChar.value(forKey: "height") as! String
            self.mass = cdChar.value(forKey: "mass") as! String
            self.hairColor = cdChar.value(forKey: "hairColor") as! String
            self.skinColor = cdChar.value(forKey: "skinColor") as! String
            self.eyeColor = cdChar.value(forKey: "eyeColor") as! String
            self.birthYear = cdChar.value(forKey: "birthYear") as! String
            self.gender = cdChar.value(forKey: "gender") as! String
            self.homeworld = cdChar.value(forKey: "homeworld") as! String
            print("COREDATA successfully loaded")
            return
        }
        
        print("No COREDATA; downloading...")
        
        let session = URLSession(configuration: .default)
        let link = URL(string: url)!
        
        let task = session.dataTask(with: link) { (data, response, error) in
            if(error != nil) {
                print("\(error!.localizedDescription): \(url)")
                return
            } else {
                guard let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any],
                    let jName = json!["name"] as? String,
                    let jHeight = json!["height"] as? String,
                    let jMass = json!["mass"] as? String,
                    let jHairColor = json!["hair_color"] as? String,
                    let jSkinColor = json!["skin_color"] as? String,
                    let jEyeColor = json!["eye_color"] as? String,
                    let jBirthYear = json!["birth_year"] as? String,
                    let jGender = json!["gender"] as? String,
                    let jHomeworld = json!["homeworld"] as? String
                    
                else {
                    print("\(url) parse error")
                    return
                }
                
                self.name = jName
                self.height = jHeight
                self.mass = jMass
                self.hairColor = jHairColor
                self.skinColor = jSkinColor
                self.eyeColor = jEyeColor
                self.birthYear = jBirthYear
                self.gender = jGender
                self.homeworld = jHomeworld
                
                DispatchQueue.main.async {
                    self.setCoreData()
                    self.cell?.loadCellData()
                    self.cell?.table?.reloadRows(at: [IndexPath(row:row, section:1)], with: .fade)
                }
            }
        }
        task.resume()
    }
    
    init() {
        moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }
    
    func setCoreData() {
        let entity =
            NSEntityDescription.entity(forEntityName: "CDCharacter", in: moc!)!
        
        let char = NSManagedObject(entity: entity, insertInto: moc!)
        
        char.setValue(name, forKeyPath: "name")
        char.setValue(height, forKeyPath: "height")
        char.setValue(mass, forKeyPath: "mass")
        char.setValue(hairColor, forKeyPath: "hairColor")
        char.setValue(skinColor, forKeyPath: "skinColor")
        char.setValue(eyeColor, forKeyPath: "eyeColor")
        char.setValue(birthYear, forKeyPath: "birthYear")
        char.setValue(gender, forKeyPath: "gender")
        char.setValue(homeworld, forKeyPath: "homeworld")
        char.setValue(url, forKey: "url")
        
        do {
            try moc!.save()
        } catch {
            print("Failed to save: \(error)")
        }
        
        print("Saved \(url)")
    }
    
    func assignCell(cell: PersonTableViewCell) {
        self.cell = cell
    }
    
    func getFromCoreData(url: String) -> NSManagedObject? {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDCharacter")
        fetchRequest.predicate = NSPredicate(format: "url = %@", url)
        
        var fetchedCharacters: [NSManagedObject] = []
        
        do {
            fetchedCharacters = try moc!.fetch(fetchRequest)
        } catch {
            print("Fetch error - \(error)")
        }
        
        if fetchedCharacters.count > 0 {
            return fetchedCharacters.first
        } else {
            return nil
        }
    }
}
