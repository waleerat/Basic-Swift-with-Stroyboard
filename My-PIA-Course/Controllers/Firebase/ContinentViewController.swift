//
//  ContinentViewController.swift
//  My-PIA-Course
//
//  Created by Waleerat Gottlieb on 2020-10-02.
//

import UIKit

class ContinentViewController: UIViewController {
    var selectedItem: Any?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Continent"
        // Do any additional setup after loading the view.
    }
}


extension ContinentViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Continent.name.count  // form Models/filebase/country.swift
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContinentIdentifier", for: indexPath) as! ContinentCollectionViewCell
        cell.continentLabel.text = Continent.name[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.1, height: collectionView.frame.height/5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedItem = Continent.name[indexPath.row]
        performSegue(withIdentifier: "seguGotoContryScreen", sender: self)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { 
        let countryVC = segue.destination as! CountryViewController
        countryVC.selectedContinent = (selectedItem!) as? String
    }
    
}
