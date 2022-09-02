//
//  HomeVM.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 20/07/22.
//

import Foundation

class HomeVM {
    
    private var manager : CDMemberManager
    var memberDetailsArray = [MemberInfo]()
    
    init(dataManager : CDMemberManager) {
        self.manager = dataManager
    }
    
    //MARK: - fetch all Data from CoreData
    func fetchData() {
        memberDetailsArray =  manager.fetchAllMembers() ?? []
    }
    
    //MARK: - delete particular member from coredata and shown list
    func deleteParticularData(index : Int) {
        let data = memberDetailsArray[index]
        manager.deleteMember(atIdentifier: data.id)
        memberDetailsArray.remove(at: index)
    }
}
