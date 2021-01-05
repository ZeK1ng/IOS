//
//  Contact+CoreDataProperties.swift
//  ContactBook
//
//  Created by zeking on 1/5/21.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var number: String?
    @NSManaged public var name: String?

}

extension Contact : Identifiable {

}
