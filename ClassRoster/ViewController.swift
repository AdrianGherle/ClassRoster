//
//  ViewController.swift
//  ClassRoster
//
//  Created by Adrian Gherle on 8/8/14.
//  Copyright (c) 2014 Adrian Gherle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView : UITableView!
    var persons = [Person]()
                            
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
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
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
            self.persons.append(Person(firstName: firstName, lastName: lastName))
        }
        println("List of persons in the class:")
        for person in self.persons {
            println("\(index++). \(person.fullName())")
        }
    }
    
    func tableView(tableView : UITableView!, numberOfRowsInSection section : Int) -> Int {
        return self.persons.count
    }
    
    func tableView(tableView : UITableView!, cellForRowAtIndexPath indexPath : NSIndexPath) -> UITableViewCell! {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell!
        var personForRow = self.persons[indexPath.row]
        cell.textLabel.text = personForRow.fullName()
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
//        var personDetail = DetailViewController(person: self.persons[indexPath.row])
        println(indexPath.section)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "detailSegue" {
            let destination = segue.destinationViewController as DetailViewController
            destination.person = persons[tableView!.indexPathForSelectedRow().row] as Person
        }
    }

    
}

