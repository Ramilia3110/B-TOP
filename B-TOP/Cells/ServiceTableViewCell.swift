//
//  ServiceTableViewCell.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/15/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {
    @IBOutlet weak var serviceTitle: UILabel!
    @IBOutlet weak var serviceDescription: UILabel!
    @IBOutlet weak var servicePrice: UILabel!
    
    
    func setData(data: Service) {
        serviceTitle.text = data.title
        serviceDescription.text = data.description
        servicePrice.text = ("\(data.price)")
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
