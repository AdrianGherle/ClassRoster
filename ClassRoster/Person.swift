//
//  Person.swift
//  ClassRoster
//
//  Created by Adrian Gherle on 8/11/14.
//  Copyright (c) 2014 Adrian Gherle. All rights reserved.
//

import Foundation
import UIKit

class Person {
    
    var firstName: String
    var lastName: String
    var optionalPicture: UIImage?
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func fullName() -> String {
        return firstName + " " + lastName
    }
    
}