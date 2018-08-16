//
//  Courses.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/9/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import Foundation
class CoursesList: Decodable {
    var results: [Course] = []
}
class Course: Decodable {
    var id :Int = 0
    var title : String = ""
    var description : String = ""
    var main_image_url: String = ""
    var logo_image_url: String = ""
    var status : String = ""
    var tariff :String = ""
    
}

    

