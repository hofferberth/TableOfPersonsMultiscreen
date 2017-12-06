//
//  PersonDetailViewController.swift
//  TableOfPersonsMultiscreen
//
//  Created by mobile consulting on 12/4/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    var person: Person? = nil
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var ssn: UILabel!
    @IBOutlet weak var job: UILabel!
    @IBOutlet weak var education: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData(person: person!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func displayData(person p: Person) {
        avatar.image = p.avatar
        name.text = "\(p.firstName) \(p.lastName)"
        age.text = "\(p.age)"
        address.text = p.address
        ssn.text = p.ssn
        job.text = p.job
        education.text = "\(p.education)"
    }
}
