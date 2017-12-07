//
//  InitViewController.swift
//  TableOfPersonsMultiscreen
//
//  Created by mobile consulting on 12/6/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import UIKit

class InitViewController: UIViewController {
    
    var characters: [SWCharacter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...87 {
            characters.append(SWCharacter(url: "https://swapi.co/api/people/\(i)/", row: i - 1))
        }
        
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
                view.characters = characters
            }
        }
    }
 
}
