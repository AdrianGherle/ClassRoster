//
//  ViewController.swift
//  ClassRoster
//
//  Created by Adrian Gherle on 8/8/14.
//  Copyright (c) 2014 Adrian Gherle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddNewPersonViewControllerDelegate {
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var addPerson: UIBarButtonItem!
    
    var students = [Person]()
    var teachers = [Person]()
    let numberOfSections = 2
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        classRoster()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
        self.students.sort {$0.lastName < $1.lastName}
        self.teachers.sort {$0.lastName < $1.lastName}
    }
    
    // Hold the student names => last : first
    var studentNames = ["Birkholz": "Nate", "Brightbill": "Matthew", "Chavez": "Jeff", "Ferderer": "Chrstie",
        "Fry": "David", "Gherle": "Adrian", "Hawken": "Jake", "Kazi": "Shams", "Klein": "Cameron",
        "Kolodziejczak": "Kori", "Lewis": "Parker", "Ma": "Nathan", "MacPhee": "Casey", "McAleer": "Brendan", "Mendez": "Brian",
        "Morris": "Mark", "North": "Rowan", "Pham": "Kevin", "Richman": "Will", "Thueringer": "Heather", "Vu": "Tuan",
        "Walkingstick": "Zack", "Wong": "Sara", "Zhang": "Hongyao"]
    
    // Hold the teacher names
    var teacherNames = ["Clem": "John", "Johnson": "Brad"]
    
    // Build the array with students and teachers of Person type object
    func classRoster() {
        var index = 1
        for (lastName, firstName) in studentNames {
            self.students.append(Person(firstName: firstName, lastName: lastName, isStudent: true))
        }
        for (lastName, firstName) in teacherNames {
            self.teachers.append(Person(firstName: firstName, lastName: lastName, isStudent: false))
        }
    }
    
    func numberOfSectionsInTableView(section : Int) -> Int {
        return numberOfSections
    }
    
    func tableView(tableView : UITableView!, numberOfRowsInSection section : Int) -> Int {
        if section == 0 {
            return self.students.count
        } else {
            return self.teachers.count
        }
    }
    
    func tableView(tableView : UITableView!, cellForRowAtIndexPath indexPath : NSIndexPath) -> UITableViewCell! {
        var personForRow : Person
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell!
        if indexPath.section == 0 {
            personForRow = self.students[indexPath.row]
        } else {
            personForRow = self.teachers[indexPath.row]
        }
        cell.textLabel.text = personForRow.fullName()
        return cell
    }
    
    func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String {
        if section == 0 {
            return "Students"
        } else {
            return "Teachers"
        }
    }
    
    // ////// Update to add teacher or student
    func saveNewPerson(controller: AddNewPersonViewController) {
        self.students.append(controller.person!)
        controller.navigationController.popViewControllerAnimated(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "detailSegue" {
            let destination = segue.destinationViewController as DetailViewController
            if tableView.indexPathForSelectedRow().section == 0 {
                destination.person = students[tableView!.indexPathForSelectedRow().row] as Person
            } else {
                destination.person = teachers[tableView!.indexPathForSelectedRow().row] as Person
            }
        }else if segue.identifier == "addPersonSegue" {
            let destination = segue.destinationViewController as AddNewPersonViewController
            destination.delegate = self
        }
    }
}

