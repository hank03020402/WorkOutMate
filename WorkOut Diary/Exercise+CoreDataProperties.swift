//
//  Exercise+CoreDataProperties.swift
//  WorkOut Diary
//
//  Created by Hank on 2017/8/2.
//  Copyright © 2017年 Hank. All rights reserved.
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var name: String?
    @NSManaged public var time: NSDate?
    @NSManaged public var id: Int16
    @NSManaged public var set: NSOrderedSet?
    @NSManaged public var workout: WorkOut?

}

// MARK: Generated accessors for set
extension Exercise {

    @objc(insertObject:inSetAtIndex:)
    @NSManaged public func insertIntoSet(_ value: Set, at idx: Int)

    @objc(removeObjectFromSetAtIndex:)
    @NSManaged public func removeFromSet(at idx: Int)

    @objc(insertSet:atIndexes:)
    @NSManaged public func insertIntoSet(_ values: [Set], at indexes: NSIndexSet)

    @objc(removeSetAtIndexes:)
    @NSManaged public func removeFromSet(at indexes: NSIndexSet)

    @objc(replaceObjectInSetAtIndex:withObject:)
    @NSManaged public func replaceSet(at idx: Int, with value: Set)

    @objc(replaceSetAtIndexes:withSet:)
    @NSManaged public func replaceSet(at indexes: NSIndexSet, with values: [Set])

    @objc(addSetObject:)
    @NSManaged public func addToSet(_ value: Set)

    @objc(removeSetObject:)
    @NSManaged public func removeFromSet(_ value: Set)

    @objc(addSet:)
    @NSManaged public func addToSet(_ values: NSOrderedSet)

    @objc(removeSet:)
    @NSManaged public func removeFromSet(_ values: NSOrderedSet)

}
