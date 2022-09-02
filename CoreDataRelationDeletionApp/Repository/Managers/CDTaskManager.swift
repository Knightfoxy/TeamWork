//
//  CDTaskManager.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 24/07/22.
//

import Foundation

struct CDTaskManager {
    
    private var _taskRepository = TaskRepository()
    var task = [TaskDetails]()
    
    func saveTask(_ data : TaskInfo , _ relation: MemberDetails) {
        _taskRepository.saveTaskData(data,relation)
    }
    mutating func fetchAllTasks(_ id : String) -> [TaskInfo]? {
        return _taskRepository.getAllTasks(id)
    }
    func deleteTask(atIdentifier : String) {
        return _taskRepository.deleteTasks(id: atIdentifier)
    }
}
