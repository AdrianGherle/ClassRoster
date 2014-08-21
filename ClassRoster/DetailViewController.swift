//
//  DetailViewController.swift
//  ClassRoster
//
//  Created by Adrian Gherle on 8/13/14.
//  Copyright (c) 2014 Adrian Gherle. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController, UIImagePickerControllerDelegate, UITextFieldDelegate, UINavigationControllerDelegate {
    var person: Person?
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var roleLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        firstName.text = person!.firstName
        lastName.text = person!.lastName
        if person!.optionalPicture != nil {
            self.imageView.image = person!.optionalPicture
        }
        
        if person!.isStudent == true {
            roleLabel.text = "Student"
        } else  {
            roleLabel.text = "Teacher"
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        person!.firstName = firstName.text
        person!.lastName = lastName.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstName.delegate = self
        self.lastName.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: UIImagePickerControllerDelegate

    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        var editedImage = info[UIImagePickerControllerEditedImage] as UIImage
        self.imageView.image = editedImage
        person!.optionalPicture = editedImage
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addPicturePressed(sender: UIButton) {
        var imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    // Add: move person to correct array
    @IBAction func selectRole(sender: UIButton) {
        if roleLabel.text == "Student" {
            roleLabel.text = "Teacher"
            person!.isStudent = false
            println(roleLabel.text)
        } else {
            roleLabel.text = "Student"
            person!.isStudent = true
            println(roleLabel.text)
        }
    }
    
    
}
