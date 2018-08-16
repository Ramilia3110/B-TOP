//
//  HomePageViewController.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/15/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var  homePageTableView: UITableView!
    var courses : [Course] = []
    var numberOfPages: Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        homePageTableView.dataSource = self
        homePageTableView.delegate = self
        homePageTableView.estimatedRowHeight = 160
        ServerManager.shared.getPaginatedCourses(pageNumber: numberOfPages, completion: setCourses, error: forError)
        // Do any additional setup after loading the view.
    }
    
    func setCourses (course: PaginatedCourses){
        self.courses.append(contentsOf: course.results!)
        self.numberOfPages = numberOfPages + 1
        homePageTableView.reloadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == courses.count - 1 {
            // load more data
            ServerManager.shared.getPaginatedCourses(pageNumber: numberOfPages + 1, completion: setCourses, error: forError)
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homePage", for: indexPath) as! HomePageTableViewCell
        cell.setCell(data: courses[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func forError(error: String) {
        print(error)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
