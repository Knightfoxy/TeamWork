//
//  CommonFunctions.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 21/07/22.
//

import Foundation
import UIKit

class CommonFunctions {
    static var shared = CommonFunctions()
    func showAlert(_ vc :  UIViewController,_ msg : String) {
        let alert = UIAlertController(title: "Notice", message: msg, preferredStyle: UIAlertController.Style.alert)
        // Create action
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
        }
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
}
