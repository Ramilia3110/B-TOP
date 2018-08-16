//
//  UpperCourseDetailTableViewCell.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/14/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit
import  Kingfisher

class UpperCourseDetailTableViewCell: UITableViewCell {
    @IBOutlet weak  var mainImage: UIImageView!
    @IBOutlet weak  var logoImage : UIImageView!
    @IBOutlet weak var title : UILabel!
    
    var delegate : CourseDelegate?
    
    @IBAction func contactsButton(button: UIButton) {
        let type = CourseInfo(rawValue: button.tag)
        delegate?.setCourse(type: type!)
    }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setUpperCell(data: CourseDetail) {
        
        let url = URL(string:data.main_image_url)
        mainImage.kf.setImage(with: url)
        let url2 = URL(string:data.logo_image_url)
        logoImage.kf.setImage(with: url2)
        
        title.text = data.title
        
        
    
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
