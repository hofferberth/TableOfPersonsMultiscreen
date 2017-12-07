//
//  PersonDetailViewController.swift
//  TableOfPersonsMultiscreen
//
//  Created by mobile consulting on 12/4/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    var person: SWCharacter? = nil
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var mass: UILabel!
    @IBOutlet weak var hairColor: UILabel!
    @IBOutlet weak var skinColor: UILabel!
    @IBOutlet weak var eyeColor: UILabel!
    @IBOutlet weak var birthYear: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var homeworld: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData(person: person!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
     self.name = jName
     self.height = jHeight
     self.mass = jMass
     self.hairColor = jHairColor
     self.skinColor = jSkinColor
     self.eyeColor = jEyeColor
     self.birthYear = jBirthYear
     self.gender = jGender
     self.homeworld = jHomeworld
     self.films = [jFilms]
     self.species = jSpecies
     self.vehicles = [jVehicles]
     self.starships = [jStarships]
    */
    func displayData(person p: SWCharacter) {
        name.text = person?.name
        height.text = person?.height
        mass.text = person?.mass
        hairColor.text = person?.hairColor
        skinColor.text = person?.skinColor
        eyeColor.text = person?.eyeColor
        birthYear.text = person?.birthYear
        gender.text = person?.gender
        homeworld.text = person?.homeworld
    }
}
