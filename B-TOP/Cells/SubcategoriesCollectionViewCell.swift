//
//  LanguagesCollectionViewCell.swift
//  Alamofire
//
//  Created by Ramilia Imankulova on 8/8/18.
//

import UIKit
import  Kingfisher
class SubcategoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet  weak var imageSubcategory: UIImageView!
    @IBOutlet weak var titleSubcategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setData(lang: Subcategory ){
        titleSubcategory.text = lang.title
        let url = URL(string: lang.subcategory_image_url)
        imageSubcategory.kf.setImage(with: url)
        
        
        
    }
    
    
}
