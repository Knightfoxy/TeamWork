//
//  AddTaskVC.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 21/07/22.
//

import UIKit

class AddTaskVC: BaseVC {
    
    //MARK: - Stored Properties
    var objTaskViewModel : AddTaskViewModel!
   
    // MARK: - IB Outlets
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextView!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var dueDate: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - Lifecycle Methods
    override func initialSetup() {
        datePicker.isHidden = true
        setUpDelegates()
        startDate.text = datePicker.dateFormatterToString(datePicker.date)
        dueDate.text = datePicker.dateFormatterToString(datePicker.date)
    }
    
    // MARK: - IB Actions
    @IBAction func didTapBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func didTapDone(_ sender: Any) {
        guard let title = titleTF.text, let desc = descriptionTF.text, let startDate = startDate.text, let dueDate = dueDate.text else { return  }
        let taskInfo = TaskInfo(title: title , description: desc, startDate: startDate, endDate: dueDate)
        switch objTaskViewModel.validate(data: taskInfo) {
        case .correct :
            objTaskViewModel.saveTasks(taskInfo)
            CommonFunctions.shared.showAlert(self, objTaskViewModel.message)
        case .incorrect :
            CommonFunctions.shared.showAlert(self, objTaskViewModel.message)
        }
    }
}

// MARK: - Extension + Delegates
extension AddTaskVC : UITextFieldDelegate, UITextViewDelegate {
    func setUpDelegates() {
        titleTF.delegate = self
        descriptionTF.delegate = self
        startDate.delegate = self
        dueDate.delegate = self
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        datePicker.isHidden = (textField == startDate || textField == dueDate ? false : true)
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        descriptionTF.text = nil
        descriptionTF.textColor = UIColor.black
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if descriptionTF.text == nil {
            descriptionTF.text = StringConstants.DescMessage.decsPlaceholder.rawValue
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == startDate {
            self.datePicker.isHidden = true
            let dateString = datePicker.dateFormatterToString(datePicker.date)
            startDate.text = dateString
            self.view.endEditing(true)
        } else if textField == dueDate {
            self.datePicker.isHidden = true
            let dateString = datePicker.dateFormatterToString(datePicker.date)
            dueDate.text = dateString
            self.view.endEditing(true)
        }
    }
}
