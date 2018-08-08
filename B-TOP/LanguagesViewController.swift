//
//  LanguagesViewController.swift
//  B-TOP
//
//  Created by Ramilia Imankulova on 8/8/18.
//  Copyright © 2018 Ramilia Imankulova. All rights reserved.
//

import UIKit

class LanguagesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var allLanguages : [Language] = []
    @IBOutlet weak var allLanguagesView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allLanguagesView.delegate = self
        allLanguagesView.dataSource = self
        ServerManager.shared.getLanguages(completion: setLanguage, error: forError)
    }
    
    func setLanguage (getLanguages:[Language]){
        allLanguages = getLanguages
        self.allLanguagesView.reloadData()
        
    }
    
    func forError(error: String) {
        print(error)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allLanguages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = allLanguagesView.dequeueReusableCell(withReuseIdentifier: "languages", for: indexPath) as! LanguagesCollectionViewCell
        cell.setData(lang: allLanguages[indexPath.row])
        return cell
        
    }
}
