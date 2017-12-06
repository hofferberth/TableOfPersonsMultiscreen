//
//  InitViewController.swift
//  TableOfPersonsMultiscreen
//
//  Created by mobile consulting on 12/6/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import UIKit

class InitViewController: UIViewController {
    
    var persons: [Person] = []

    let avatar1 = UIImage(imageLiteralResourceName: "bill")
    let avatar2 = UIImage(imageLiteralResourceName: "tinyface")
    let avatar3 = UIImage(imageLiteralResourceName: "salad")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tempPerson = Person(avatar: avatar1, firstName: "Bill", lastName: "Ensofli", age: 46, address: "123 Street Rd", ssn: "123-45-6789", job: "Professional Businessman", education: Person.Education.bachelors)
        persons.append(tempPerson)
        tempPerson = Person(avatar: avatar2, firstName: "Carol", lastName: "Krisman", age: 34, address: "456 Boulevard St", ssn: "987-65-4321", job: "Amateur Christmas Caroler", education: Person.Education.streetSmarts)
        persons.append(tempPerson)
        tempPerson = Person(avatar: avatar3, firstName: "Jimmy", lastName: "Russel", age: 19, address: "1 One Ave", ssn: "111-11-1112", job: "Salad Whisperer", education: Person.Education.phd)
        persons.append(tempPerson)
        
        performSegue(withIdentifier: "Init", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Init" {
            if let view = segue.destination as? ViewController {
                view.persons = persons
            }
        }
    }
 
}
