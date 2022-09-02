//
//  AddMemberViewModel.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 22/07/22.
//

import Foundation

class AddMemberVM {
    var manager = CDMemberManager()
    var message : String = StringConstants.Constants.blank.rawValue
    init(dataManager : CDMemberManager) {
        self.manager = dataManager
    }
    //MARK: - Validations For Member Details
    func validate(data : MemberInfo) ->  InputCheck {
        if data.name.isEmpty {
            message = StringConstants.AlertMessages.blankName.rawValue
            return .incorrect
        } else if !data.email.isValidEmail() && data.email.isEmpty {
            message = StringConstants.AlertMessages.invlidEmail.rawValue
            return .incorrect
        } else if data.dob.isEmpty {
            message = StringConstants.AlertMessages.blankDOB.rawValue
            return .incorrect
        } else if data.phoneNum.isEmpty {
            message = StringConstants.AlertMessages.blankNumber.rawValue
            return .incorrect
        } else if !data.phoneNum.isNumeric {
            message = StringConstants.AlertMessages.invalidMobNum.rawValue
            return .incorrect
        } else if data.gender.isEmpty {
            message = StringConstants.AlertMessages.blankGender.rawValue
            return .incorrect
        } else if data.aboutUser.isEmpty {
            message = StringConstants.AlertMessages.aboutMe.rawValue
            return .incorrect
        } else {
            message = StringConstants.AlertMessages.savedData.rawValue
            return .correct
        }
    }
    //MARK: - To save member to CoreData
    func saveMember(data : MemberInfo) {
        manager.saveMember(data: data)
    }
    
}
