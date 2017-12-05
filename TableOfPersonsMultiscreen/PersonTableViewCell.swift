//
//  PersonTableViewCell.swift
//  TableOfPersonsMultiscreen
//
//  Created by mobile consulting on 12/4/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    private var _person: Person!
    var person: Person {
        get {return _person}
        set {
            _person = newValue
            loadCellData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _person = Person()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadCellData() {
        avatar.image = _person.avatar
        nameLabel.text = "\(_person.firstName) \(_person.lastName)"
        ageLabel.text = "\(_person.age)"
    }
}

class Person {
    enum Education {
        case highSchool, bachelors, masters, phd, streetSmarts
    }
    
    var firstName: String
    var lastName: String
    var avatar: UIImage?
    var age: Int
    var address: String
    var ssn: String
    var job: String
    var education: Education
    
    init(avatar: UIImage? = nil, firstName: String, lastName: String, age: Int, address: String, ssn: String, job: String, education: Education) {
        if let av = avatar {
            self.avatar = av
        } else {
            self.avatar = UIImage(imageLiteralResourceName: "blank")
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.address = address
        self.ssn = ssn
        self.job = job
        self.education = education
    }
    
    init () {
        self.avatar = UIImage()
        self.firstName = ""
        self.lastName = ""
        self.age = 0
        self.address = ""
        self.ssn = ""
        self.job = ""
        self.education = Education.streetSmarts
    }
}
