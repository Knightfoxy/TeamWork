//
//  UIDatePicker.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 22/07/22.
//

import UIKit

extension UIDatePicker {
    func dateFormatterToString(_ date : Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/mm/dd"
        dateFormatter.dateStyle = .short
        let stringDate = dateFormatter.string(from: date)
        return stringDate
    }
    func dateFormatterToDate(_ date : Date) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/mm/dd"
        dateFormatter.dateStyle = .short
        let newdatw = dateFormatter.string(from: date)
        guard let newdate = dateFormatter.date(from:newdatw) else { return Date()}
        return newdate
    }
}
