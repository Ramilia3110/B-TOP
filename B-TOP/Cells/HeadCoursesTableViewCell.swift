//
//  HeadCoursesTableViewCell.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/13/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit

class HeadCoursesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var headTitleL: UILabel!
    
    var headImage: String?
    var headTitle: String?
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
 
    func setHeadCell() {
        
        let url = URL(string: headImage!)
        logoImg.kf.setImage(with: url)
        
        headTitleL.text = headTitle
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

 

    
}
