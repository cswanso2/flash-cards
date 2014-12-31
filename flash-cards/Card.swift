//
//  Card.swift
//  flash-cards
//
//  Created by Charlie Swanson on 12/29/14.
//  Copyright (c) 2014 Charlie Swanson. All rights reserved.
//

import Foundation
import CoreData

class Card: NSManagedObject {

    @NSManaged var front: String
    @NSManaged var back: String
    @NSManaged var views: NSNumber
    @NSManaged var right: NSNumber
    @NSManaged var wrong: NSNumber
    @NSManaged var belongsTo: Set

}
