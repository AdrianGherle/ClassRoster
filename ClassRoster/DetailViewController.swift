//
//  DetailViewController.swift
//  ClassRoster
//
//  Created by Adrian Gherle on 8/13/14.
//  Copyright (c) 2014 Adrian Gherle. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController : UIViewController {
    var person: Person?
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!

    
    override func viewWillAppear(animated: Bool) {
        firstName.text = person?.firstName
        lastName.text = person?.lastName
    }
    
    override func viewDidDisappear(animated: Bool) {
        person?.firstName = firstName.text
        person?.lastName = lastName.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}
