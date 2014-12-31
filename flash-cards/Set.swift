//
//  Set.swift
//  flash-cards
//
//  Created by Charlie Swanson on 12/29/14.
//  Copyright (c) 2014 Charlie Swanson. All rights reserved.
//

import Foundation
import CoreData

@objc(Set)
class Set: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var views: NSNumber
    @NSManaged var selfCreated: NSNumber
    @NSManaged var numberOfCards: NSNumber
    @NSManaged var hasCard: NSSet

}
