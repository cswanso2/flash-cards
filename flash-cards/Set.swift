//
//  Set.swift
//  flash-cards
//
//  Created by Charlie Swanson on 12/29/14.
//  Copyright (c) 2014 Charlie Swanson. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(Set)
class Set: NSManagedObject {
    //change
    @NSManaged var title: String
    @NSManaged var views: NSNumber
    @NSManaged var selfCreated: NSNumber
    @NSManaged var numberOfCards: NSNumber
    @NSManaged var hasCard: NSSet

    /*
    @title: will be the sets title
    @views: will be the sets views
    @selfCreated: is the set created by the user of this phone.
    @numberOfCards: The number of cards in this set. Will typically be zero for a self created set.
    Description: Function that creates a set and saves it to the persistent core data database
    */
    class func createSet(title: String, views: NSNumber, selfCreated: NSNumber, numberOfCards: NSNumber)
    {
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var newSet = NSEntityDescription.insertNewObjectForEntityForName("Set", inManagedObjectContext: context) as Set
        newSet.title = title
        newSet.selfCreated = selfCreated
        newSet.views = views
        newSet.selfCreated = selfCreated
        var error: NSError? = nil
        context.save(&error)
    }
    
    /*
    @title: the title of the set we are receiving
    @return : returns the set, or nil if not found.
    Description: Returns a set if one is available.
    */
    class func getSet(title: String) -> Set
    {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName:"Set")
        let predicate = NSPredicate(format: "title == %@", title)
        fetchRequest.predicate = predicate
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest,error: &error) as [Set]
        let set = fetchedResults[0]
        return set
        //onle one set should have the name
    }
}
