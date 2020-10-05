//
//  CountryTableViewController.swift
//  My-PIA-Course
//
//  Created by Waleerat Gottlieb on 2020-10-04.
//

import UIKit
import Firebase
import SwipeCellKit

class CountryTableViewController: UITableViewController {
    
    var selectedContinent: String!
     
    let db = Firestore.firestore()
    let collectionName = "contries"
    var itemArray = [Country]()
    var selectedRow: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.selectedContinent = "Asia"
        
        if  let item = selectedContinent {
            navigationItem.title = item
        }
        
        loadItemsToTableView()
        tableView.rowHeight = 60
        
    }
    // MARK: - TableView Datasource Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemArray.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! SwipeTableViewCell
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.country ?? "Empty Data"
        
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(">>> didSelectRowAt")
    }
    
    // MARK: - Manage Data  / Model Munpulation Methods
        func loadItemsToTableView() {
            if let documentName = selectedContinent {
                db.collection(collectionName).document(documentName)
                    .collection("countries").addSnapshotListener { (QuerySnapshot, Error) in
                    // Check if document exist
                    guard let documents = QuerySnapshot?.documents else {
                        //No document
                        return
                    }
                    // get data
                    self.itemArray = documents.compactMap({ (QueryDocumentSnapshot) -> Country? in
                       return try? QueryDocumentSnapshot.data(as: Country.self)
                    })
                    
                    for _ in self.itemArray {
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }
            
        }
        
        func createNewRecord(_ countryName:String, _ capitalName:String){
            if let documentName = selectedContinent {
                let newContryData = Country(country: countryName ,capital: capitalName)
                do {
                    try db.collection(collectionName).document(documentName)
                        .collection("countries").document(countryName)
                        .setData(from: newContryData)
                    self.itemArray.append(newContryData)
                    tableView.reloadData()
                } catch let error {
                    print("Error writing city to Firestore: \(error)")
                }
            }
        }
        
        func deleteRow()  {
            db.collection("cities").document("DC").delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }
            }
        }
 
}

// MARK: - Swipe cell delegate methods
extension CountryTableViewController: SwipeTableViewCellDelegate  {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            self.updateModel(at: indexPath)
        }
        // customize the action appearance
        deleteAction.image = UIImage(named: "trash-circle")
        
        return [deleteAction]
    }
    
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        
        return options
    }
    
    func updateModel(at indexPath: IndexPath) {
        // Update our data model
    }
    
}
