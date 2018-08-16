//
//  HomePageTableViewCell.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/15/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit
import  Kingfisher

class HomePageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var courseDescription: UILabel!
    
    func setCell(data: Course) {
        let url = URL(string: data.main_image_url)
        mainImage.kf.setImage(with: url)
        
        let url2 = URL(string: data.logo_image_url)
        logo.kf.setImage(with: url2)
     
        
        courseTitle.text = data.title
        courseDescription.text = data.description
        
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
