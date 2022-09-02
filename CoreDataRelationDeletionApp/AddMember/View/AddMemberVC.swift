//
//  AddMemberVC.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 21/07/22.
//

import UIKit

class AddMemberVC: UIViewController {
    //MARK: - Stored Properties
    var addMemberVM : AddMemberVM!
    var genderPickerView = UIPickerView()
    //MARK: - IB Outlets
    @IBOutlet weak var aboutUser: UITextView!
    @IBOutlet weak var userGender: UITextField!
    @IBOutlet weak var userPhoneNum: UITextField!
    @IBOutlet weak var dOB: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userName: UITextField!
    //MARK: - Lifecycle methods
    override func viewDidLoad() {
        addMemberVM = AddMemberVM(dataManager: CDMemberManager())
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        userGender.inputView = genderPickerView
        super.viewDidLoad()
    }
    //MARK: - IB Actions
    @IBAction func didTapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func didTapSave(_ sender: Any) {
        guard let name = userName.text, let gender = userGender.text,let phoneNum = userPhoneNum.text,let dob = dOB.text, let email = userEmail.text,let aboutMe = aboutUser.text else {return }
        let memberInfo = MemberInfo(name: name , gender: gender, aboutUser: aboutMe, dob: dob, email: email, phoneNum: phoneNum)
        switch addMemberVM.validate(data: memberInfo) {
        case .correct :
            addMemberVM.saveMember(data: memberInfo)
            CommonFunctions.shared.showAlert(self, addMemberVM.message)
        case .incorrect :
            CommonFunctions.shared.showAlert(self, addMemberVM.message)
        }
    }
}  
extension AddMemberVC : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return StringConstants.IntConst.one.rawValue
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        genderArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userGender.text = genderArray[row]
        userGender.resignFirstResponder()
    }
    
}
