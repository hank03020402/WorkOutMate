//
//  User+CoreDataProperties.swift
//  WorkOut Diary
//
//  Created by Hank on 2017/8/2.
//  Copyright © 2017年 Hank. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var bodyfat: Double
    @NSManaged public var height: String?
    @NSManaged public var name: String?
    @NSManaged public var weight: String?

}
