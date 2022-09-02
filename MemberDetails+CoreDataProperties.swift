//
//  MemberDetails+CoreDataProperties.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 24/07/22.
//
//

import Foundation
import CoreData


extension MemberDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemberDetails> {
        return NSFetchRequest<MemberDetails>(entityName: "MemberDetails")
    }

    @NSManaged public var aboutUser: String?
    @NSManaged public var email: String?
    @NSManaged public var gender: String?
    @NSManaged public var name: String?
    @NSManaged public var phoneNum: String?
    @NSManaged public var userDOB: String?
    @NSManaged public var userId: String?
    @NSManaged public var toTask: Set<TaskDetails>?
}

// MARK: Generated accessors for toTask
extension MemberDetails {

    @objc(addToTaskObject:)
    @NSManaged public func addToToTask(_ value: TaskDetails)

    @objc(removeToTaskObject:)
    @NSManaged public func removeFromToTask(_ value: TaskDetails)

    @objc(addToTask:)
    @NSManaged public func addToToTask(_ values: Set<TaskDetails>)

    @objc(removeToTask:)
    @NSManaged public func removeFromToTask(_ values: Set<TaskDetails>)

}
extension MemberDetails : Identifiable {

}
