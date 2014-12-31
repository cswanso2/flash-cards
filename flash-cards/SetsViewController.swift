//
//  SetsViewController.swift
//  flash-cards
//
//  Created by Charlie Swanson on 12/30/14.
//  Copyright (c) 2014 Charlie Swanson. All rights reserved.
//

import UIKit
import CoreData

class SetsViewController: UITableViewController {

    var sets = [Set]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate =
            UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let fetchRequest = NSFetchRequest(entityName:"Set")
        
        //3
        var error: NSError?
        
        let fetchedResults =
        managedContext.executeFetchRequest(fetchRequest,
            error: &error) as [Set]?
        
        if let results = fetchedResults {
            sets = results
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // 1
        return 1
    }

    
    override func tableView(
        tableView: UITableView,
        numberOfRowsInSection section: Int)
        -> Int {
            return sets.count
    }
    
    override func tableView(
        tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            
            var cell = tableView.dequeueReusableCellWithIdentifier("setCell") as UITableViewCell
            var currentSet = sets[indexPath.row] as Set
            
            cell.textLabel?.text = currentSet.title
            cell.detailTextLabel?.text = "\(currentSet.views)"
            
            return cell
    }
}

