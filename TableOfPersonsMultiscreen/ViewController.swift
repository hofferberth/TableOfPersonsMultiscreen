//
//  ViewController.swift
//  TableOfPersonsMultiscreen
//
//  Created by mobile consulting on 12/4/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var persons: [Person] = []
    
    @IBOutlet weak var table: UITableView!
    
    let avatar1 = UIImage(imageLiteralResourceName: "bill")
    let avatar2 = UIImage(imageLiteralResourceName: "tinyface")
    let avatar3 = UIImage(imageLiteralResourceName: "salad")
    
    var initialized = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func populateTable() {
        var tempPerson = Person(avatar: avatar1, firstName: "Bill", lastName: "Ensofli", age: 46, address: "123 Street Rd", ssn: "123-45-6789", job: "Professional Businessman", education: Person.Education.bachelors)
        persons.append(tempPerson)
        tempPerson = Person(avatar: avatar2, firstName: "Carol", lastName: "Krisman", age: 34, address: "456 Boulevard St", ssn: "987-65-4321", job: "Amateur Christmas Caroler", education: Person.Education.streetSmarts)
        persons.append(tempPerson)
        tempPerson = Person(avatar: avatar3, firstName: "Jimmy", lastName: "Russel", age: 19, address: "1 One Ave", ssn: "111-11-1112", job: "Salad Whisperer", education: Person.Education.phd)
        persons.append(tempPerson)
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        table.setEditing(!table.isEditing, animated: true)
    }
    
    @IBAction func createButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "Create", sender: self)
    }
    
    @IBAction func cancelCreate(segue: UIStoryboardSegue) {
        print("Canceled")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let detailView = segue.destination as? PersonDetailViewController {
                detailView.person = persons[tableView.indexPathForSelectedRow!.row]
            }
        } else if segue.identifier == "Create" {
            if let createView = segue.destination as? CreationViewController {
                createView.receivedArr = persons
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersonTableViewCell
        
        cell.person = persons[indexPath.row]
        
        if indexPath.row % 2 == 1 {
            cell.backgroundColor = UIColor.lightGray
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        persons.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
}

