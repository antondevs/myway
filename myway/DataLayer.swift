//
//  DataLayer.swift
//  myway
//
//  Created by antondev on 05/01/17.
//  Copyright © 2017 engune. All rights reserved.
//

import UIKit
import CoreData

class DataLayer {
    
    static let sharedInstance = DataLayer()
    
    private init() {}
    
    func addRoute(name:String) -> Route {
        let desc = NSEntityDescription.entity(forEntityName: "Route", in: CoreDataManager.sharedInstance.managedObjectContext);
        let route = NSManagedObject(entity: desc!, insertInto: CoreDataManager.sharedInstance.managedObjectContext) as! Route
        route.date = Date() as NSDate?
        route.name = name
        CoreDataManager.sharedInstance.saveContext()
        return route;
    }
    
    func getRoutes() -> [Route] {
        var routes:[Route] = []
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Route")
        do {
            routes = try CoreDataManager.sharedInstance.managedObjectContext.fetch(fetchRequest) as! [Route]
        } catch {
            print(error)
        }
        
        return routes;
    }
    
}
