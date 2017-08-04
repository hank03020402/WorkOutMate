//
//  WorkOut+CoreDataProperties.swift
//  WorkOut Diary
//
//  Created by Hank on 2017/8/2.
//  Copyright © 2017年 Hank. All rights reserved.
//

import Foundation
import CoreData


extension WorkOut {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkOut> {
        return NSFetchRequest<WorkOut>(entityName: "WorkOut")
    }

    @NSManaged public var name: String?
    @NSManaged public var exercises: NSOrderedSet?
    @NSManaged public var time : NSDate?
    @NSManaged public var id : Int16
}

// MARK: Generated accessors for exercises
extension WorkOut {

    @objc(insertObject:inExercisesAtIndex:)
    @NSManaged public func insertIntoExercises(_ value: Exercise, at idx: Int)

    @objc(removeObjectFromExercisesAtIndex:)
    @NSManaged public func removeFromExercises(at idx: Int)

    @objc(insertExercises:atIndexes:)
    @NSManaged public func insertIntoExercises(_ values: [Exercise], at indexes: NSIndexSet)

    @objc(removeExercisesAtIndexes:)
    @NSManaged public func removeFromExercises(at indexes: NSIndexSet)

    @objc(replaceObjectInExercisesAtIndex:withObject:)
    @NSManaged public func replaceExercises(at idx: Int, with value: Exercise)

    @objc(replaceExercisesAtIndexes:withExercises:)
    @NSManaged public func replaceExercises(at indexes: NSIndexSet, with values: [Exercise])

    @objc(addExercisesObject:)
    @NSManaged public func addToExercises(_ value: Exercise)

    @objc(removeExercisesObject:)
    @NSManaged public func removeFromExercises(_ value: Exercise)

    @objc(addExercises:)
    @NSManaged public func addToExercises(_ values: NSOrderedSet)

    @objc(removeExercises:)
    @NSManaged public func removeFromExercises(_ values: NSOrderedSet)

}
