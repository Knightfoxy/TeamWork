//
//  TaskDetails+CoreDataProperties.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 24/07/22.
//
//

import Foundation
import CoreData


extension TaskDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskDetails> {
        return NSFetchRequest<TaskDetails>(entityName: "TaskDetails")
    }

    @NSManaged public var desc: String?
    @NSManaged public var endDate: String?
    @NSManaged public var startDate: String?
    @NSManaged public var taskId: String?
    @NSManaged public var title: String?
    @NSManaged public var toMember: MemberDetails?

}

extension TaskDetails : Identifiable {

}
