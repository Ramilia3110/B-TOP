//
//  AllCategoriesCollectionViewCell.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/8/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit
import Kingfisher

class AllCategoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet  weak var imageCategories: UIImageView!
    @IBOutlet weak var titleCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setData(category:Category){
        titleCategory.text = category.title
        let url = URL(string: category.category_image_url)
        imageCategories.kf.setImage(with: url)
        
        
        
    }
    
}
