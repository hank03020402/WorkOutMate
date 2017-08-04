//
//  Exercise+CoreDataClass.swift
//  WorkOut Diary
//
//  Created by Hank on 2017/7/30.
//  Copyright © 2017年 Hank. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(Exercise)
public class Exercise: NSManagedObject {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    static func newExercise() -> Exercise{
        let exercise = NSEntityDescription.insertNewObject(forEntityName: "Exercise", into: managedContext)as! Exercise
        return exercise
    }
    static func addSetObject(value: Set) {
        self.mutableSetValue(forKey: "set").add(value)
    }
    static func saveExercise(){
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Could not save \(error)")
        }
    }
    static func delete(exercise: Exercise){
        managedContext.delete(exercise)
        saveExercise()
    }
    static func retrieveExercise()->[Exercise]{
        let fetchRequest = NSFetchRequest<Exercise>(entityName:"Exercise")
        do{
            let results = try managedContext.fetch(fetchRequest)
            return results
        }catch let error as NSError{
            print("Could not save \(error)")
        }
        return []
    }
    
}
