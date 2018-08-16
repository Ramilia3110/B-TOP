//
//  ContactsTableViewCell.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/14/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    @IBOutlet weak var  contactLabel: UILabel!
    @IBOutlet weak var phoneCall: UIButton!
    @IBAction func openContact() {
        guard let url = URL(string: contactLabel.text!) else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setDetail(data: Contact) {
        contactLabel.text = data.contact
        if data.type == "PHONE" {
            phoneCall.setImage(#imageLiteral(resourceName: "call"), for: UIControlState.normal)
        } else {
            phoneCall.setImage(#imageLiteral(resourceName: "globe"), for: UIControlState.normal)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
