//
//  CoursesTableViewCell.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/10/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit
import Kingfisher

class CoursesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    
    @IBOutlet weak var descriptionOfCourse: UITextView!
    
    
    @IBOutlet weak var imageOfCourse: UIImageView!
    
    func setCourseCell(course: Course) {
        
        title.text = course.title
        descriptionOfCourse.text = course.description
        let url = URL(string: course.logo_image_url)
        logo.kf.setImage(with: url)
        let url1 = URL(string: course.main_image_url)
        imageOfCourse.kf.setImage(with: url)
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

