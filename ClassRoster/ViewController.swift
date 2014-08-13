//
//  ViewController.swift
//  ClassRoster
//
//  Created by Adrian Gherle on 8/8/14.
//  Copyright (c) 2014 Adrian Gherle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var persons = [Person]()
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        classRoster()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    Holds an array of String dictionary with all the student names => last : first
    var students = ["Birkholz": "Nate", "Brightbill": "Matthew", "Chavez": "Jeff", "Clem": "John", "Ferderer": "Chrstie",
        "Fry": "David", "Gherle": "Adrian", "Hawken": "Jake", "Johnson": "Brad", "Kazi": "Shams", "Klein": "Cameron",
        "Kolodziejczak": "Kori", "Lewis": "Parker", "Ma": "Nathan", "MacPhee": "Casey", "McAleer": "Brendan", "Mendez": "Brian",
        "Morris": "Mark", "North": "Rowan", "Pham": "Kevin", "Richman": "Will", "Thueringer": "Heather", "Vu": "Tuan",
        "Walkingstick": "Zack", "Wong": "Sara", "Zhang": "Hongyao"]
    
    func classRoster() {
        var index = 1
        for (lastName, firstName) in students {
            persons.append(Person(firstName: firstName, lastName: lastName))
        }
        println("List of persons in the class:")
        for person in persons {
            println("\(index++). \(person.fullName())")
        }
    }
}

