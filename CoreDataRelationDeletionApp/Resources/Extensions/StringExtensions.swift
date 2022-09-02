//
//  StringExtensions.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 22/07/22.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        if let regex = try? NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: .caseInsensitive) {
            return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        }
        return false
    }
        var isNumeric: Bool {
            return  range(of: "[^0-9]", options: .regularExpression) == nil
        }
}
