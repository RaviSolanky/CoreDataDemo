//
//  Person.swift
//  CoreDataDemo
//
//  Created by semidot on 26/08/24.
//

//import UIKit
//
//class Person: NSObject {
//
//}


import Foundation
import CoreData

@objc(Person)
public class Person: NSManagedObject {

}

extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
}


