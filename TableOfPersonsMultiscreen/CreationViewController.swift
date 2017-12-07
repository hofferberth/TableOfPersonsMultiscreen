//
//  CreationViewController.swift
//  TableOfPersonsMultiscreen
//
//  Created by mobile consulting on 12/4/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var ssn: UITextField!
    @IBOutlet weak var job: UITextField!
    @IBOutlet weak var education: UISegmentedControl!
    
    var person: SWCharacter?
    var receivedArr: [SWCharacter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func addPersonPressed(_ sender: Any) {
        if(anyAreEmpty()) {
            print("Fill out form completely please")
        } else {
            performSegue(withIdentifier: "Save", sender: self)
        }
    }
    
    func anyAreEmpty() -> Bool {
        if(!firstName.text!.isEmpty && !lastName.text!.isEmpty && !age.text!.isEmpty && !address.text!.isEmpty && !ssn.text!.isEmpty && !job.text!.isEmpty) {
            return false
        }
        
        return true
    }
    
    func loadPerson() {
/*        let first = firstName.text ?? "FUCK"
        let last = lastName.text ?? "FUCK"
        let a = Int(age.text ?? "FUCK") ?? -1
        let add = address.text ?? "FUCK"
        let social = ssn.text ?? "FUCK"
        let j = job.text ?? "FUCK"
        let edu: Person.Education
        if(education.selectedSegmentIndex == 0) {
            edu = Person.Education.highSchool
        } else if(education.selectedSegmentIndex == 1) {
            edu = Person.Education.bachelors
        } else if(education.selectedSegmentIndex == 2) {
            edu = Person.Education.masters
        } else if(education.selectedSegmentIndex == 3) {
            edu = Person.Education.phd
        } else {
            edu = Person.Education.streetSmarts
        }
        
        person = Person(firstName: first, lastName: last, age: a, address: add, ssn: social, job: j, education: edu)
 */
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Save") {
            let destView = segue.destination as! ViewController
            print(receivedArr.count)
            loadPerson()
            receivedArr.append(person!)
            destView.characters = receivedArr
        } else if(segue.identifier == "Cancel") {
            // Do Nothing
        }
    }
    
}
