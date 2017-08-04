//
//  Set+CoreDataClass.swift
//  WorkOut Diary
//
//  Created by Hank on 2017/7/30.
//  Copyright © 2017年 Hank. All rights reserved.
//

import Foundation
import CoreData
import UIKit
@objc(Set)
public class Set: NSManagedObject {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    static func newSet() -> Set{
        let set = NSEntityDescription.insertNewObject(forEntityName: "Set", into: managedContext)as! Set
        return set
    }
    static func saveSet(){
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Could not save \(error)")
        }
    }
    static func delete(set: Set){
        managedContext.delete(set)
        saveSet()
    }
    static func retrieveSets()->[Set]{
        let fetchRequest = NSFetchRequest<Set>(entityName:"Set")
        do{
            let results = try managedContext.fetch(fetchRequest)
            return results
        }catch let error as NSError{
            print("Could not save \(error)")
        }
        return []
    }
    
}
