//
//  CollectionViewScreenViewController.swift
//  My-PIA-Course
//
//  Created by Waleerat Gottlieb on 2020-10-02.
//

import UIKit

class CollectionViewScreenViewController: UIViewController {
    var sectionItems = [
        ["Sweden","Dammark","Norway","Thai"],
        ["Stockholm", "Copenhegen","Oslo","Bangkok"]
    ]
    var HeaderItems = ["Country","City"]

    override func viewDidLoad() {
        navigationItem.title = "CollectionView"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension CollectionViewScreenViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionItems[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IdentifierCollertionViewCell", for: indexPath) as! CollectionViewCell
        cell.showCollectionLabel.text = sectionItems[indexPath.section][indexPath.row]
        
        if indexPath.section % 2 == 0 {
            cell.showCollectionLabel.backgroundColor = UIColor.orange
        } else {
            cell.showCollectionLabel.backgroundColor = UIColor.blue
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.2, height: collectionView.frame.height/5)
    }
    // MARK: - Header  ReuseHeader
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ReuseHeader", for: indexPath) as! HeaderCollectionReusableView
        header.headerLabel.text = HeaderItems[indexPath.section]
        
        return header
    }
}



