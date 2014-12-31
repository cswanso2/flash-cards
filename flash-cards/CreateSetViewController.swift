//
//  CreateSetViewController.swift
//  flash-cards
//
//  Created by Charlie Swanson on 12/29/14.
//  Copyright (c) 2014 Charlie Swanson. All rights reserved.
//

import UIKit
import CoreData

class CreateSetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createButtonPressed(sender: UIButton) {
        println("create button pressed")
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
    
        var newSet = NSEntityDescription.insertNewObjectForEntityForName("Set", inManagedObjectContext: context) as Set
        newSet.title = nameField.text
        newSet.selfCreated = true
        
        var error: NSError? = nil
        context.save(&error)
        println(nameField.text)
    }

    @IBOutlet weak var nameField: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
