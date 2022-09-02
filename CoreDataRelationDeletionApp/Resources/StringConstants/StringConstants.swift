//
//  StringConstants.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 21/07/22.
//

import Foundation

enum StringConstants {
    // StoryBoard Names
    enum StoryBoard : String {
        case main = "Main"
    }
    // Cells Identifiers
    enum Identifiers : String {
        case addTask = "AddTaskVC"
        case taskTC = "TaskTableCell"
        case taskPage = "TaskPageVC"
        case userDetail = "UserDetailsCell"
        case addMember = "AddMemberVC"
    }
    enum DescMessage : String {
        case decsPlaceholder = "Enter Description Of your Work"
    }
    enum Constants : String {
        case blank = ""
    }
    enum DateType : String {
        case string
        case date
    }
    enum DateFormat : String {
        case yyyyMMdd = "yyyy MM dd"
    }
    enum EntityName : String {
        case tasks = "Tasks"
    }
    enum Day : String {
        case today = "Today"
    }
    // Integer Constants Used
    enum IntConst : Int {
        case one  = 1
    }
    enum Gender : String {
        case m = "Male"
        case f = "Female"
        case o = "Other"
    }
    enum AlertMessages : String {
        case blankName = "Enter your namer first"
        case invlidEmail = "Enter a Valid Email"
        case blankDOB = "Enter your Date Of Birth"
        case blankNumber = "Enter your Phone Number"
        case invalidMobNum = "Enter a valid Phone Number"
        case blankGender = "Enter your Gender"
        case aboutMe = "Write something about you."
        case savedData = "Data Saved"
        case blankTitle = "Enter Title for the task"
        case blankDesc = "Enter description of task"
        case blankStartDate = "Tell us when to start the task"
        case blankEndDate = "Tell us when to end the task"
    }

}
