//
//  Extension.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 21/07/22.
//

import Foundation
import UIKit

// MARK: - Extension to Homepage View Controller
extension HomePageVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objHomeVM.memberDetailsArray.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name:  StringConstants.StoryBoard.main.rawValue, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: StringConstants.Identifiers.taskPage.rawValue) as! TaskPageVC
        vc.taskVM = TaskViewModel.init(taskManager: CDTaskManager())
        vc.taskVM.memberDetails = objHomeVM.memberDetailsArray[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = baseTableView.dequeueReusableCell(withIdentifier: StringConstants.Identifiers.userDetail.rawValue, for: indexPath) as? UserDetailsCell {
            cell.objCellVM = UserCellViewModel(item: objHomeVM.memberDetailsArray[indexPath.row])
            cell.displayCell()
            return cell
        } else {
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            baseTableView.beginUpdates()
            objHomeVM.deleteParticularData(index: indexPath.row)
            baseTableView.deleteRows(at: [indexPath], with: .none)
            baseTableView.endUpdates()
            baseTableView.reloadData()
        }
    }
}
extension HomePageVC {
    func registerNib(_ cellIdentifier : String,_ baseTableView : UITableView) {
        let cellNib = UINib(nibName: cellIdentifier , bundle: nil)
        baseTableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
    }
    func initialTableSetting() {
        self.baseTableView.delegate = self
        self.baseTableView.dataSource = self
        registerNib(StringConstants.Identifiers.userDetail.rawValue, baseTableView)
    }
    func navigationVC(_ sbName : String,_ id : String) {
        let sb = UIStoryboard(name: sbName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: id)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
