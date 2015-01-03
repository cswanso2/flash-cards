//
//  Card.swift
//  flash-cards
//
//  Created by Charlie Swanson on 12/29/14.
//  Copyright (c) 2014 Charlie Swanson. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Card: NSManagedObject {

    @NSManaged var front: String
    @NSManaged var back: String
    @NSManaged var views: NSNumber
    @NSManaged var right: NSNumber
    @NSManaged var wrong: NSNumber
    @NSManaged var belongsTo: Set

    class func createCard(front: String, back: String, views: NSNumber, right: NSNumber, wrong: NSNumber, holdingSet: Set)
    {
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var newCard = NSEntityDescription.insertNewObjectForEntityForName("Card", inManagedObjectContext: context) as Card
        newCard.front = front
        newCard.back = back
        newCard.views = views
        newCard.right = right
        newCard.wrong = wrong
        holdingSet.hasCard = holdingSet.hasCard.setByAddingObject(newCard)
        var error: NSError? = nil
        context.save(&error)
    }
}
