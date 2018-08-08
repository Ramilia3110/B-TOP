//
//  LanguagesCollectionViewCell.swift
//  Alamofire
//
//  Created by Ramilia Imankulova on 8/8/18.
//

import UIKit
import  Kingfisher
class LanguagesCollectionViewCell: UICollectionViewCell {
    @IBOutlet  weak var imageLanguage: UIImageView!
    @IBOutlet weak var titleLanguage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setData(lang: Language ){
        titleLanguage.text = lang.title
        let url = URL(string: lang.subcategory_image_url)
        imageLanguage.kf.setImage(with: url)
        
        
        
    }
    
    
}
