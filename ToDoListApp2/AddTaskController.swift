//
//  Controller2ViewController.swift
//  ToDoListApp2
//
//  Created by Mac on 3/26/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class AddTaskController: UIViewController {
    
    var labelTaskText: String?
    var labelDescriptionText: String?
    var updateCondition: Bool?
    var saveCondition: Bool?
    var index2: Int?
    var addImage: String?
    
    
    @IBOutlet weak var btnSaveOutlet: UIButton!
    @IBOutlet weak var btnUpdateOutlet: UIButton!
    @IBOutlet weak var tbxDescription: UITextField!
    @IBOutlet weak var tbxtask: UITextField!
    @IBOutlet weak var btnImage3: UIButton!
    @IBOutlet weak var btnimage2: UIButton!
    @IBOutlet weak var btnImage: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.btnSaveOutlet.layer.cornerRadius = 10
        self.btnUpdateOutlet.layer.cornerRadius = 10
        self.btnUpdateOutlet.enabled = false
        self.btnImage.layer.cornerRadius = self.btnImage.frame.size.width / 2
        self.btnimage2.layer.cornerRadius = self.btnImage3.frame.size.width / 2
        self.btnImage3.layer.cornerRadius = self.btnimage2.frame.size.width / 2
        self.btnImage.clipsToBounds = true
        self.btnimage2.clipsToBounds = true
        self.btnImage3.clipsToBounds = true
        
        if labelTaskText != "" && labelTaskText != nil
            
        {
            
            tbxtask.text = labelTaskText
            tbxDescription.text = labelDescriptionText
            btnUpdateOutlet.enabled = updateCondition!
            btnSaveOutlet.enabled = saveCondition!
            btnSaveOutlet.alpha = 0.2
            
        }
        
    }
    
    @IBAction func updateButtonAction(sender: AnyObject)
        
    {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
        
    {
        let mysegue: ViewController = segue.destinationViewController as! ViewController
        
        if segue.identifier == "saveIdentifier"
        {
            
            let objStruct = TaskStruct(myTask: tbxtask.text, Description: tbxDescription.text!, photo: addImage!)
            TaskStruct.structArray.append(objStruct)
            
            
            
        }
        
        if segue.identifier == "updateIdentifier"
            
        {
            mysegue.updateMyTask = tbxtask.text
            mysegue.updateDescription = tbxDescription.text
            mysegue.updatePhoto = addImage
            mysegue.index = index2
            
        }
    }
    
    @IBAction func btnSaveAction(sender: AnyObject)
        
    {
    }
    
    
    @IBAction func btnImageAction1(sender: AnyObject)
        
    {
        addImage = "c.jpg"
        
        
    }
    
    @IBAction func btnImageAction2(sender: AnyObject)
        
    {
        addImage = "b.jpg"
        
    }
    
    @IBAction func btnImageAction3(sender: AnyObject)
    {
        addImage = "a.jpg"
        
    }
    
}
