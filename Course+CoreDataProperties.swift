//
//  Course+CoreDataProperties.swift
//  CoreDataR
//
//  Created by Bablu Joshi on 09/08/17.
//  Copyright © 2017 Qa infotech. All rights reserved.
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var bookname: String?
    @NSManaged public var fees: String?
    @NSManaged public var name: String?
    @NSManaged public var startDate: String?
    @NSManaged public var person: Person?

}
