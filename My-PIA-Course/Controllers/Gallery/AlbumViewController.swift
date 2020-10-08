//
//  GalleryViewController.swift
//  My-PIA-Course
//
//  Created by Waleerat Gottlieb on 2020-10-05.
//
import UIKit
import FirebaseStorage
import Firebase
import FirebaseUI
 

class AlbumViewController: UIViewController {
    var sectionItems = [
        ["Dannie","Sebastian","Frederik","Arne"],
        ["Waleerat", "Emilia","Sara","Janifer"]
    ]
    var HeaderItems = ["Men","Women"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAlbum()
    }
    
    func loadAlbum(){
        let storage = Storage.storage()
        let storageReference = storage.reference()//.child("sixpack/")
        storageReference.listAll { (result, error) in
            if error != nil {
            print(">> \(error)")
          }
          for prefix in result.prefixes {
            print(">>>>> \(prefix)")
            let storageReference = storage.reference().listAll(completion:  )
            
           //self.loadImage(child: prefix)
            // The prefixes under storageReference.
            // You may call listAll(completion:) recursively on them.
          }
          for item in result.items {
            print(" item => \(item)")
          }
        }
    }
    /*
    func loadImage(child: StorageReference){
        let storageReference = storage.reference().child("child")
        storageReference.listAll { (result, error) in
            if error != nil {
            print(">> \(error)")
          }
          for prefix in result.prefixes {
            print(" prefix=> \(prefix)")
            // The prefixes under storageReference.
            // You may call listAll(completion:) recursively on them.
          }
          for item in result.items {
            print(" item => \(item)")
          }
        }
    }*/
} 


extension AlbumViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionItems[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IdentifierCollertionViewCell", for: indexPath) as! AlbumCollectionViewCell
        cell.photoImageView.image = #imageLiteral(resourceName: "imageView-beach") //sectionItems[indexPath.section][indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.2, height: collectionView.frame.height/5)
    }
    
    // MARK: - Header  ReuseHeader
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "albumNameHeader", for: indexPath) as! AlbumCollectionReusableView
        header.albumNameHeaderLabel.text = HeaderItems[indexPath.section]

        return header
    }
}
