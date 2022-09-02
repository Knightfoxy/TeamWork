//
//  Model.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 22/07/22.
//

import Foundation

struct MemberInfo {
    var name : String
    var gender : String
    var aboutUser : String
    var dob : String
    var email : String
    var phoneNum : String
    var id = String()
}

var genderArray : [String] = [StringConstants.Gender.m.rawValue
                              , StringConstants.Gender.f.rawValue
                              , StringConstants.Gender.o.rawValue]
