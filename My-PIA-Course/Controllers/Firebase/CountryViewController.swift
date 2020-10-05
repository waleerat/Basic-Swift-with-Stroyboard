//
//  CountryViewController.swift
//  My-PIA-Course
//
//  Created by Waleerat Gottlieb on 2020-10-02.
//  Asia, Africa, North America, South America, Antarctica, Europe,
// 

import UIKit
import Firebase


class CountryViewController: UIViewController {
    
    @IBOutlet weak var countryNameTextfield: UITextField!
    @IBOutlet weak var countriesTableVeiw: UITableView!
    @IBOutlet weak var capitalNameTextfield: UITextField!
   
    var selectedContinent: String!
     
    let db = Firestore.firestore()
    let collectionName = "contries"
    var itemArray = [Country]()
    var selectedRow: Int = 0
   // var itemArray =  ["Thai", "Chaina","Japan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if  let item = selectedContinent {
            navigationItem.title = item
        }
        
        loadItemsToTableView()
    }
    
    @IBAction func clickAddCountrybnt(_ sender: UIButton) {
        
        if let countryName = countryNameTextfield.text, let capitalName = capitalNameTextfield.text {
            if countryName != "" && capitalName != "" {
                createNewRecord(countryName, capitalName)
            }
        }else{
        }
        countryNameTextfield.text = ""
        capitalNameTextfield.text  = ""
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
                            self.countriesTableVeiw.reloadData()
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
                    self.countriesTableVeiw.reloadData()
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


// MARK: - TableView DataSource Method
 
extension CountryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemArray.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
        let item = itemArray[indexPath.row]
        selectedRow = indexPath.row
        cell.countryLabel.text = item.country
        cell.capitalLabel.text = item.capital
        return cell
    }
    
    
}
