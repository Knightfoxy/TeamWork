//
//  AddTaskViewModel.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 22/07/22.
//

import Foundation

class AddTaskViewModel {
    private var manager : CDTaskManager
    var memberDetail : MemberInfo?
    var message : String = StringConstants.Constants.blank.rawValue
    
    init(dataManager : CDTaskManager) {
        self.manager = dataManager
    }
    
    // MARK: - Validations For Task Details
    func validate(data : TaskInfo) ->  InputCheck {
        if data.title.isEmpty {
            message = StringConstants.AlertMessages.blankTitle.rawValue
            return .incorrect
        }  else if data.description.isEmpty {
            message = StringConstants.AlertMessages.blankDesc.rawValue
            return .incorrect
        } else if data.startDate.isEmpty {
            message = StringConstants.AlertMessages.blankStartDate.rawValue
            return .incorrect
        }  else if data.endDate.isEmpty {
            message = StringConstants.AlertMessages.blankEndDate.rawValue
            return .incorrect
        } else {
            message = StringConstants.AlertMessages.savedData.rawValue
            return .correct
        }
    }
    func saveTasks(_ task : TaskInfo) {
        let data = PersistentStorage.shared.fetchManagedObject(managedObject: MemberDetails.self)
        data?.forEach({ cdData in
            if cdData.userId == memberDetail?.id {
                manager.saveTask(task,cdData)
          }
        })
    }
}
