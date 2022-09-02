//
//  TaskPageVC.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 21/07/22.
//

import UIKit

class TaskPageVC: BaseVC {
    
    //MARK: - Stored Properties
    var taskVM : TaskViewModel!
    
    //MARK: - IB Outlets
    @IBOutlet weak var addTask: UIButton!
    @IBOutlet weak var baseTableView: UITableView!
    
    //MARK: - Custom Methods
    override func initialSetup() {
        intitalSettings()
        taskVM.fetchData()
        gestureRecogniser()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        taskVM.fetchData()
        baseTableView.reloadData()
    }
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        addTask.layer.cornerRadius = addTask.frame.height * 0.5
    }
    //MARK: - IB Actions
    @IBAction func didTapAddTask(_ sender: Any) {
        let sb = UIStoryboard(name: StringConstants.StoryBoard.main.rawValue, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: StringConstants.Identifiers.addTask.rawValue) as! AddTaskVC
        vc.objTaskViewModel = AddTaskViewModel(dataManager: CDTaskManager())
        vc.objTaskViewModel.memberDetail = taskVM.memberDetails
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK: - Extensions + Delegates
extension TaskPageVC {
    func intitalSettings() {
        self.baseTableView.delegate = self
        self.baseTableView.dataSource = self
        self.registerNib(StringConstants.Identifiers.taskTC.rawValue, baseTableView)
    }
}
extension TaskPageVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskVM.taskDetailsArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = baseTableView.dequeueReusableCell(withIdentifier: StringConstants.Identifiers.taskTC.rawValue, for: indexPath) as? TaskTableCell {
            cell.objCellVM.data = taskVM.taskDetailsArray[indexPath.row] 
            return cell
        } else {
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            baseTableView.beginUpdates()
            taskVM.deleteParticularTask(atIndex: indexPath.row)
            baseTableView.deleteRows(at: [indexPath], with: .none)
            baseTableView.endUpdates()
            baseTableView.reloadData()
        }
    }
    func registerNib(_ cellIdentifier : String,_ baseTableView : UITableView) {
        let cellNib = UINib(nibName: cellIdentifier , bundle: nil)
        baseTableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
    }
    func initialSetting() {
        self.baseTableView.delegate = self
        self.baseTableView.dataSource = self
    }
}
