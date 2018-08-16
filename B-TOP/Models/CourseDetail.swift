//
//  CourseDetail.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/14/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import Foundation
class CourseDetail: Decodable {
    var id : Int = 0
    var title : String = ""
    var description: String = ""
    var main_image_url :String = ""
    var logo_image_url: String = ""
    var contacts : [Contact] = []
    var branches : [Branch] = []
    var services : [Service] = []
    var status : String = ""
    var tariff : String = ""
    var actions : [ActionCourse] = []
    var added : String = ""
    var updated : String = ""
}
class Contact: Decodable {
    var type : String = ""
    var contact: String = ""
}
class Branch: Decodable {
    var address: String = ""
    var latitude :String = ""
    var longitude : String = ""
    
}
class Service : Decodable {
    var title : String = ""
    var description :String = ""
    var price :String = ""
    
}
class ActionCourse: Decodable {
    var id : Int = 0
    var title : String = ""
    var description : String = ""
    var end_date: String = ""
    var action_image : String = ""
}
