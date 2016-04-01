//
//  ViewController.swift
//  ToDoListApp2
//
//  Created by Mac on 3/26/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

struct TaskStruct {
    
    var myTask: String?
    var Description: String?
    var photo: String?
    static var structArray: [TaskStruct] = []
    
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var index: Int?
    
    @IBOutlet weak var editBarButtonOutlet: UIBarButtonItem!
    @IBOutlet weak var tblview: UITableView!
    @IBOutlet weak var cancelbarButtonOutlet: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.cancelbarButtonOutlet.enabled = false
        self.editBarButtonOutlet.enabled = false
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let mycell: CustomCellTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! CustomCellTableViewCell
        
        mycell.ViewInCellOutlet.layer.cornerRadius = 5
        
        if  TaskStruct.structArray.count == 0
            
        {
            return mycell
        }
        
        mycell.lblTask.text = TaskStruct.structArray[indexPath.row].myTask
        mycell.lblDescription.text = TaskStruct.structArray[indexPath.row].Description
        mycell.photoImageViewOutlet.image = UIImage(named:TaskStruct.structArray[indexPath.row].photo!)
        
        
        
        
        return mycell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if TaskStruct.structArray.count == 0
        {
            
            return 0
            
        }
        
        return TaskStruct.structArray.count
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        index = indexPath.row
        self.cancelbarButtonOutlet.enabled = true
        self.editBarButtonOutlet.enabled = true
        
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let mysegue2: AddTaskController = segue.destinationViewController as! AddTaskController
        if segue.identifier == "editsegue"
        {
            
            
            mysegue2.updateCondition = true
            mysegue2.saveCondition = false
            mysegue2.index2 = index
            
            print(index)
            print(TaskStruct.structArray[index!])
            
            mysegue2.labelTaskText = TaskStruct.structArray[index!].myTask
            mysegue2.labelDescriptionText = TaskStruct.structArray[index!].Description
            mysegue2.addImage = TaskStruct.structArray[index!].photo
            
        }
        
    }
    
    @IBAction func addBarButton(sender: AnyObject)
        
    {
        
    }
    
    @IBAction func cancelbarButtonAction(sender: UIBarButtonItem)
    {
        if index != nil
            
        {
            TaskStruct.structArray.removeAtIndex(index!)
            self.cancelbarButtonOutlet.enabled = false
            self.editBarButtonOutlet.enabled = false
            tblview.reloadData()
            
        }
        
    }
    
    @IBAction func editBarButtonAction(sender: UIBarButtonItem)
    {
        
        
    }
    
    
    
}

