//
//  Set+CoreDataProperties.swift
//  WorkOut Diary
//
//  Created by Hank on 2017/8/2.
//  Copyright © 2017年 Hank. All rights reserved.
//

import Foundation
import CoreData


extension Set {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Set> {
        return NSFetchRequest<Set>(entityName: "Set")
    }

    @NSManaged public var exerciseName: String?
    @NSManaged public var repetition: Int16
    @NSManaged public var weight: Double
    @NSManaged public var exercise: Exercise?

}
