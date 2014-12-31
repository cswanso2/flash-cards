//
//  SetsViewController.swift
//  flash-cards
//
//  Created by Charlie Swanson on 12/30/14.
//  Copyright (c) 2014 Charlie Swanson. All rights reserved.
//

import UIKit

class SetsViewController: UITableViewController {

    var sets = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sets = [
            "set1",
            "set2",
            "set3"
        ]
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
            
            cell.textLabel?.text = sets[indexPath.row]
            cell.detailTextLabel?.text = "0"
            
            return cell
    }
}

