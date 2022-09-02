//
//  TaskCellViewModel.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 24/07/22.
//

import Foundation

class TaskCellViewModel {
    var data = TaskInfo(title: StringConstants.Constants.blank.rawValue,
                        description:  StringConstants.Constants.blank.rawValue,
                        startDate:  StringConstants.Constants.blank.rawValue,
                        endDate:  StringConstants.Constants.blank.rawValue)
    
//    init(task : TaskInfo) {
//        self.data = task
//    }
    // to Fetch the cell data
    func fetchCellData() -> TaskInfo {
        return data
    }
}
