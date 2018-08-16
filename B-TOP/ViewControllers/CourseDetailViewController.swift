//
//  CourseDetailViewController.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/14/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit

class CourseDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CourseDelegate {
   
   
    
    
    @IBOutlet var courseDetailTableView: UITableView!
    var courseDetail : CourseDetail!
    var currentType : CourseInfo = .info
    var courseID : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        courseDetailTableView.delegate = self
        courseDetailTableView.dataSource = self
        courseDetailTableView.rowHeight = 140
        ServerManager.shared.getCourseDetail(id: courseID, completion: setData, error: forError)
        
    }
    func setData(data:CourseDetail)
    {
        self.courseDetail = data
        self.courseDetailTableView.reloadData()
    }
    
    func forError(error: String) {
        print(error)
    }
    
    
    func setCourse(type: CourseInfo) {
        currentType = type
        print(type)
        courseDetailTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if courseDetail == nil {
            return 0
        }
        if section == 0 {
            return 1
        }
        if currentType == .contacts{
            
        return courseDetail.contacts.count
        }
        if currentType == .info {
            return 1
        }
        if currentType == .address {
            return courseDetail!.branches.count
        }
        if currentType == .services {
            return courseDetail!.services.count
        }
        if currentType == .actions {
            return courseDetail!.actions.count
        }
        return 0
        }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "upperDetail", for: indexPath) as! UpperCourseDetailTableViewCell
            cell.delegate = self
            cell.setUpperCell(data: courseDetail)
            return cell
        }
        if currentType == .contacts {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contacts", for: indexPath) as! ContactsTableViewCell
            cell.setDetail(data: courseDetail.contacts[indexPath.item])
        return cell
        }
        if currentType == .address {
            let cell = tableView.dequeueReusableCell(withIdentifier: "branch", for: indexPath) as!  BranchTableViewCell
            cell.setData(data: courseDetail.branches[indexPath.item])
            return cell
        }
        
        if currentType == .info {
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as!  InfoTableViewCell
            cell.setData(data:  courseDetail!)
            return cell
        }
        
        if currentType == .services {
            let cell = tableView.dequeueReusableCell(withIdentifier: "services", for: indexPath) as!  ServiceTableViewCell
            cell.setData(data: courseDetail.services[indexPath.item])
            return cell
        }
        if currentType == .actions {
            let cell = tableView.dequeueReusableCell(withIdentifier: "action", for: indexPath) as!  ActionTableViewCell
            cell.setData(data: courseDetail.actions[indexPath.item])
            return cell
        }
        return  UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 350
        } else {
            return UITableViewAutomaticDimension
        }
    }
}
