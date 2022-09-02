//
//  TaskTableCell.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 21/07/22.
//

import UIKit

class TaskTableCell : UITableViewCell {
    
    //MARK: - Stored Properties
    var objCellVM = TaskCellViewModel()
    
    //MARK: - IB Outlets
    @IBOutlet weak var taskDateLbl: UILabel!
    @IBOutlet weak var taskDescription : UILabel!
    @IBOutlet weak var taskTitle: UILabel!
    
    //MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.displayCell()
    }
    
    //MARK: - Custom Methods
    func displayCell() {
        taskTitle.text = objCellVM.fetchCellData().title
        taskDescription.text = objCellVM.fetchCellData().description
        taskDateLbl.text = "\(objCellVM.fetchCellData().startDate) - \(objCellVM.fetchCellData().endDate)"
    }
    
}
