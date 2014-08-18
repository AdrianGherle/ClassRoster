//
//  AddNewPersonViewController.swift
//  ClassRoster
//
//  Created by Adrian Gherle on 8/16/14.
//  Copyright (c) 2014 Adrian Gherle. All rights reserved.
//

import UIKit

protocol AddNewPersonViewControllerDelegate {
    func saveNewPerson(controller : AddNewPersonViewController)
}

class AddNewPersonViewController : UIViewController {
    
    var person: Person?
    var delegate: AddNewPersonViewControllerDelegate? = nil
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var requiredLabel: UILabel!
    @IBOutlet weak var save: UIBarButtonItem!
    @IBAction func saveAction(sender: UIBarButtonItem) {
        if delegate! != nil {
            if validateName() {
                person = Person(firstName: firstName.text, lastName: lastName.text)
                delegate!.saveNewPerson(self)
            } else {
                requiredLabel.text = "Must complete all required fields"
                requiredLabel.textColor = UIColor.redColor()
            }
        }
    }

    func validateName() -> Bool {
        if firstName.text != "" && lastName.text != "" {
            return true
        } else {
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
