//
//  ActionTableViewCell.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/15/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit
import Kingfisher

class ActionTableViewCell: UITableViewCell {
    @IBOutlet weak var actionTitle: UILabel!
    @IBOutlet weak var actionDescription: UILabel!
    @IBOutlet weak var actionDate: UILabel!
    @IBOutlet weak var actionImage: UIImageView!
    
    func setData(data: ActionCourse) {
        actionTitle.text = data.title
        actionDescription.text = data.description
        actionDate.text = data.end_date
        
        let url = URL(string: data.action_image)
        actionImage.kf.setImage(with: url)
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
