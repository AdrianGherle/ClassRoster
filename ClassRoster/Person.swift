//
//  Person.swift
//  ClassRoster
//
//  Created by Adrian Gherle on 8/11/14.
//  Copyright (c) 2014 Adrian Gherle. All rights reserved.
//


import UIKit

class Person: NSCoder {
    
    var firstName: String
    var lastName: String
    var isStudent: Bool
    var optionalPicture: UIImage?
    
    init(firstName: String, lastName: String, isStudent: Bool) {
        self.firstName = firstName
        self.lastName = lastName
        self.isStudent = isStudent
    }
    
    func fullName() -> String {
        return lastName + " " + firstName
    }
    
//    func encodeWithCoder(coder: NSCoder) {
//        coder.encodeObject(<#object: AnyObject!#>)
//    }
//    
//    required init (coder aDecoder: NSCoder!) {
//        self.firstName 
//    }
    
//    -(id)initWithCoder: (decoder NSCoder) {
//    
//    }
    
//    encodeWithCoder
    
}