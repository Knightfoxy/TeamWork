//
//  CDMembersManager.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 22/07/22.
//

import Foundation

struct CDMemberManager {
    
    private var _memberRepository = MemberDataRepository()
    var member = [MemberDetails]()
    
    func saveMember(data: MemberInfo) {
        _memberRepository.saveMemberData(data)
    }
    mutating func fetchAllMembers() -> [MemberInfo]? {
        return _memberRepository.getAllMembersData()
    }
    func deleteMember(atIdentifier : String) {
        return _memberRepository.deleteData(id: atIdentifier)
    }

}
