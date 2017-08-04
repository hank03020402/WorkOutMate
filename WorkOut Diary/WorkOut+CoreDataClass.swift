//
//  WorkOut+CoreDataClass.swift
//  WorkOut Diary
//
//  Created by Hank on 2017/8/2.
//  Copyright © 2017年 Hank. All rights reserved.
//

import Foundation
import CoreData
import UIKit
@objc(WorkOut)
public class WorkOut: NSManagedObject {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    static func newWorkOut() -> WorkOut{
        let workout = NSEntityDescription.insertNewObject(forEntityName: "WorkOut", into: managedContext)as! WorkOut
        return workout
    }
    static func saveWorkOut(){
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Could not save \(error)")
        }
    }
    static func delete(workout: WorkOut){
        managedContext.delete(workout)
        saveWorkOut()
    }
    static func retrieveWorkOuts()->[WorkOut]{
        let fetchRequest = NSFetchRequest<WorkOut>(entityName:"WorkOut")
        do{
            let results = try managedContext.fetch(fetchRequest)
            return results
        }catch let error as NSError{
            print("Could not save \(error)")
        }
        return []
    }

}

