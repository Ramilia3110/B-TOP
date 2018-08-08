//
//  AllCategoriesViewController.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/8/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit

class AllCategoriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var allCategories : [Category] = []
    @IBOutlet weak var allCategoriesView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allCategoriesView.delegate = self
        allCategoriesView.dataSource = self
        ServerManager.shared.getAllCategories(completion: setCategory, error: forError)
    }
    
    func setCategory (getCategories:[Category]){
        allCategories = getCategories
        self.allCategoriesView.reloadData()
        
    }
    
    func forError(error: String) {
        print(error)
    }


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allCategories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = allCategoriesView.dequeueReusableCell(withReuseIdentifier: "categories", for: indexPath) as! AllCategoriesCollectionViewCell
        cell.setData(category: allCategories[indexPath.row])
        return cell
        
    }
}
