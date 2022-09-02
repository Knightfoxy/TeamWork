//
//  UserDetailsCell.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 21/07/22.
//

import UIKit

class UserDetailsCell: UITableViewCell {
    
    //MARK: - Stored Properties
    var objCellVM : UserCellViewModel!
    
    //MARK: - IB Outlets
    @IBOutlet private(set) weak var gender: UILabel!
    @IBOutlet private(set) weak var emailTF: UILabel!
    @IBOutlet private(set) weak var nameTF: UILabel!
    
    //MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
    }
    
    //MARK: - Custom Methods
    func displayCell() {
        nameTF.text = objCellVM.data.name
        emailTF.text = objCellVM.data.email
        gender.text = objCellVM.data.gender
    }
}
