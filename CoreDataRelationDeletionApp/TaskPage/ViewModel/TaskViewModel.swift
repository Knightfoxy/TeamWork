//
//  TaskViewModel.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 21/07/22.
//

import Foundation

class TaskViewModel {
    //MARK: - Stored Properties
    private var manager : CDTaskManager
    var taskDetailsArray = [TaskInfo]()
    var memberDetails : MemberInfo?
    
    init(taskManager : CDTaskManager) {
        self.manager = taskManager
    }
    
    //MARK: - Fetch all Data from CoreData
    func fetchData()  {
        taskDetailsArray =  manager.fetchAllTasks(memberDetails?.id ?? "") ?? []
    }
    
    //MARK: - Delete particular Data from CoreData
    func deleteParticularTask(atIndex :Int) {
        let data = taskDetailsArray[atIndex]
        manager.deleteTask(atIdentifier: data.id)
        taskDetailsArray.remove(at: atIndex)
    }
}
