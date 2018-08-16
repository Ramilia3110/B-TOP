//
//  ServerManager.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/7/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
///Users/ramiliaimankulova/Desktop/B-TOP/B-TOP/Network


import Foundation


class ServerManager: HTTPRequestManager {
    static let shared = ServerManager()
    
    func getAllCategories (completion: @escaping ([Category]) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: Constants.Network.EndPoint.categories, completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode([Category].self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
    func getSubcategories (id:Int, completion: @escaping ([Subcategory]) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: "\(Constants.Network.EndPoint.subcategories)\(id)/", completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode([Subcategory].self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
    func getCourses(id:Int, completion: @escaping ([Course]) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: "\(Constants.Network.EndPoint.courses)\(id)/", completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode([Course].self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
    
    func getCourseDetail(id:Int, completion: @escaping (CourseDetail) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: "\(Constants.Network.EndPoint.courseDetail)\(id)/", completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode(CourseDetail.self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
    
    func getPaginatedCourses(pageNumber: Int, completion: @escaping (PaginatedCourses) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: "\(Constants.Network.EndPoint.paginatedCourses)\(pageNumber)", completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode(PaginatedCourses.self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
    
    
}

