//
//  UserDetailsVM.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 21/07/22.
//

import Foundation

class UserCellViewModel {
    
    let data : MemberInfo
    init(item : MemberInfo) {
        self.data = item
    }
    func fetchCellData() -> MemberInfo {
        return data
    }
}
