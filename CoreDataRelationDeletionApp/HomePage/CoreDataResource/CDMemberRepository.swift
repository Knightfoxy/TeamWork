//
//  CoreDataRepository.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 22/07/22.
//

import UIKit
import CoreData

protocol CoreDataRepository {
    func saveMemberData(_ data : MemberInfo)
    func getAllMembersData() -> [MemberInfo]
    func deleteData(id : String)
}

class MemberDataRepository : CoreDataRepository {
    static var shared = MemberDataRepository()
    let context = PersistentStorage.shared.persistentContainer.viewContext
    
    func saveMemberData(_ data : MemberInfo) {
        let member = MemberDetails(context: context)
        member.name = data.name
        member.email = data.email
        member.gender = data.gender
        member.phoneNum = data.phoneNum
        member.userDOB = data.dob
        member.aboutUser = data.aboutUser
        member.userId = UUID().uuidString
        PersistentStorage.shared.saveContext()
    }
    func getAllMembersData() -> [MemberInfo] {
        var arrayOfMembers : [MemberInfo] = []
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: MemberDetails.self)
        result?.forEach({member in
            guard let name = member.name else {return}
            guard let email = member.email else {return}
            guard let gender = member.gender else {return}
            guard let dob = member.userDOB else {return}
            guard let phoneNum = member.phoneNum else {return}
            guard let aboutUser = member.aboutUser else {return}
            guard let id = member.userId else {return}
            let member = MemberInfo(name: name, gender: gender, aboutUser: aboutUser, dob: dob, email: email, phoneNum: phoneNum , id: id)
            arrayOfMembers.append(member)
        })
        return arrayOfMembers
    }
    func deleteData(id : String) {
        let data = PersistentStorage.shared.fetchManagedObject(managedObject: MemberDetails.self)
        data?.forEach({ item in
            if item.userId == id {
                PersistentStorage.shared.removeMangedObject(data: item)
                return
            }
        })
    }
}
