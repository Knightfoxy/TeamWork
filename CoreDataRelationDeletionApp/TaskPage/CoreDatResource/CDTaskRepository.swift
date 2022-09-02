//
//  CDTaskRepository.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 24/07/22.
//

import Foundation
import CoreData

protocol CDTaskRepository {
    func saveTaskData(_ data : TaskInfo,_ relation : MemberDetails)
    func getAllTasks(_ id : String) -> [TaskInfo]
}

class TaskRepository : CDTaskRepository {
    static var shared = TaskRepository()
    let context = PersistentStorage.shared.persistentContainer.viewContext
    
    func saveTaskData(_ data : TaskInfo,_ relation : MemberDetails) {
        let task = TaskDetails(context: context)
        task.toMember = relation
        do {
            task.title = data.title
            task.desc = data.description
            task.startDate = data.startDate
            task.endDate = data.endDate
            task.taskId = UUID().uuidString
        }
        PersistentStorage.shared.saveContext()
    }
    
    func getAllTasks(_ id : String) -> [TaskInfo] {
        var arrayOfTask : [TaskInfo] = []
        let request : NSFetchRequest<TaskDetails> = TaskDetails.fetchRequest()
        let predicate = NSPredicate(format: "toMember.userId MATCHES %@", id)
        request.predicate = predicate
        do {
            let result = try PersistentStorage.shared.viewContext.fetch(request)
            result.forEach({task in
                guard let title = task.title else {return}
                guard let desc = task.desc else {return}
                guard let startDate = task.startDate else {return}
                guard let endDate = task.endDate else {return}
                let task = TaskInfo(title: title, description: desc, startDate: startDate, endDate: endDate)
                arrayOfTask.append(task)
            })
        } catch let error {
            print(error)
        }
        return arrayOfTask
    }
    
    func deleteTasks(id : String) {
        let data = PersistentStorage.shared.fetchManagedObject(managedObject: TaskDetails.self)
        data?.forEach({ item in
            if item.taskId == id {
                PersistentStorage.shared.removeMangedObject(data: item)
                return
            }
        })
    }
}
