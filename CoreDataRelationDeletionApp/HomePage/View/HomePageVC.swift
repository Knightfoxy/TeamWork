//
//  ViewController.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 20/07/22.
//

import UIKit
import Foundation

class HomePageVC: BaseVC {
    
    // MARK: - Stored Properties
    var objHomeVM : HomeVM!
    
    // MARK: - IB Outlets
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var baseTableView: UITableView!

    // MARK: - Lifecycle Methods
    override func initialSetup() {
        objHomeVM = HomeVM(dataManager: CDMemberManager())
        self.view.addSubview(addBtn)
        objHomeVM.fetchData()
        self.initialTableSetting()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        objHomeVM.fetchData()
        baseTableView.reloadData()
    }
    // runs when anything changes in view layout eg : CornerRadius , Aspect Ratio etc.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addBtn.layer.cornerRadius = addBtn.frame.height * 0.5
    }
    
    // MARK: - Custom Methods
    @IBAction func didTapAddMember(_ sender: Any) {
        self.navigationVC(StringConstants.StoryBoard.main.rawValue, StringConstants.Identifiers.addMember.rawValue)
    }
}
