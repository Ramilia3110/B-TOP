//
//  Subcategories.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/8/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import Foundation

class Subcategory: Decodable {
    var id: Int = 0
    var title : String = ""
    var parent : Int = 0
    var subcategory_image_url: String = ""
}
