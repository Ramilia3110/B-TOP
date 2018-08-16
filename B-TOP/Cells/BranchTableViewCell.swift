//
//  BranchTableViewCell.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/15/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit

class BranchTableViewCell: UITableViewCell {
    @IBOutlet weak var branchLabel: UILabel!
    
    func setData(data: Branch) {
        branchLabel.text = data.address
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
