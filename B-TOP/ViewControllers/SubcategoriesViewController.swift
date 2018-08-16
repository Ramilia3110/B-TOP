//
//  LanguagesViewController.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/8/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit

class SubcategoriesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    

    var subcategories : [Subcategory] = []
    var categoryID: Int = 0
    @IBOutlet weak var subcategoriesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subcategoriesCollectionView.delegate = self
        subcategoriesCollectionView.dataSource = self
        ServerManager.shared.getSubcategories(id: categoryID, completion: setSubcategory, error: forError)
    }
    
    func setSubcategory (aSubcategories:[Subcategory]){
        self.subcategories = aSubcategories
        self.subcategoriesCollectionView.reloadData()
        
    }
    
    func forError(error: String) {
        print(error)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subcategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = subcategoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "subcategories", for: indexPath) as! SubcategoriesCollectionViewCell
        cell.setData(lang: subcategories [indexPath.row])
        return cell
        
    
}
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "coursesVC") as! CoursesViewController
        vc.courseID = subcategories[indexPath.item].id
        self.show(vc, sender: self)
        
    }
}

