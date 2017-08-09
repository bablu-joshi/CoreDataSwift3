//
//  Person+CoreDataProperties.swift
//  CoreDataR
//
//  Created by Bablu Joshi on 09/08/17.
//  Copyright © 2017 Qa infotech. All rights reserved.
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var cellno: String?
    @NSManaged public var name: String?
    @NSManaged public var course: Course?

}
