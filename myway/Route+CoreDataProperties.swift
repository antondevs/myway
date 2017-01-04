//
//  Route+CoreDataProperties.swift
//  myway
//
//  Created by antondev on 05/01/17.
//  Copyright © 2017 engune. All rights reserved.
//

import Foundation
import CoreData


extension Route {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Route> {
        return NSFetchRequest<Route>(entityName: "Route");
    }

    @NSManaged public var name: String?
    @NSManaged public var date: NSDate?

}
