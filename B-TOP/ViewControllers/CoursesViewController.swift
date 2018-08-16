//
//  CoursesViewController.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/9/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var coursesList: [Course] = []
    var courseID: Int = 0
    var headImage: String? = ""
    var headTitle: String? = ""
    @IBOutlet weak var coursesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        coursesTableView.delegate = self
        coursesTableView.dataSource = self
        coursesTableView.rowHeight = 160
        ServerManager.shared.getCourses(id: courseID, completion: setCourses, error: forError)
    }
    
    func setCourses (course:[Course]){
        self.coursesList = course
        self.coursesTableView.reloadData()
        
    }
    
    func forError(error: String) {
        print(error)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } 
        return coursesList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "headCourse", for: indexPath) as! HeadCoursesTableViewCell
            cell.headImage = headImage
            cell.headTitle = headTitle
            cell.setHeadCell()
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "course", for: indexPath) as! CoursesTableViewCell
        cell.setCourseCell(course: coursesList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "courseDetailVC") as! CourseDetailViewController
        vc.courseID = coursesList[indexPath.item].id
        self.show(vc, sender: self)
    }
   
    
    
}
