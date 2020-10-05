/*
 
 //
 //  SwipeTableViewController.swift
 //  Todoey
 //
 //  Created by Philipp Muellauer on 29/11/2019.
 //  Copyright © 2019 Philipp Muellauer. All rights reserved.
 //

 import UIKit
 import SwipeCellKit
 //import RealmSwift

 class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {
     
     override func viewDidLoad() {
         super.viewDidLoad()
         tableView.rowHeight = 80.0
         
     }
     
     //TableView Datasource Methods
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
         
         cell.delegate = self
         
         return cell
     }
     
     func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
         guard orientation == .right else { return nil }
         
         let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
             
             self.updateModel(at: indexPath)
             
         }
         // customize the action appearance
         deleteAction.image = UIImage(named: "delete-icon")
         
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

 
 
 
 func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
     print(">> \(indexPath.row)")
     let documentName = "Asia"
     let countryName = "Thai"
     guard orientation == .right else { return nil }
     let deleteAction = SwipeAction(style: .destructive, title: "") { action, indexPath in
         // handle action by updating model with deletion
         self.db.collection(self.collectionName).document(documentName)
             .collection("countries").document(countryName).delete() { err in
             if let err = err {
                 print("Error removing document: \(err)")
             } else {
                 print("Document successfully removed!")
             }
         }
         tableView.reloadData()
     }
     // customize the action appearance
     deleteAction.image = UIImage(named: "trash-circle")

     return [deleteAction]
 }
 

 func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
     var options = SwipeOptions()
     options.expansionStyle = .destructive
     options.transitionStyle = .border
     return options
 }
 //
 //  CategoryViewController.swift
 //  TodoList-ISO13
 //
 //  Created by Waleerat Gottlieb on 2020-09-25.
 //

 import UIKit
 import CoreData

 class CategoryViewController: UITableViewController {
     
     var itemArray = [Categories]()  // 1. define array
     // Optional :  4. Set View context for popup
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

     override func viewDidLoad() {
         super.viewDidLoad()
         //print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
         loadCategories()  // 2. load data to array
     }
     
     // MARK: - TableView Datasource Methods
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return itemArray.count  // 3. count Array
     }
     
     // 4. connect table with TableCell  this function will be called (itemArray.count) times
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
         let item = itemArray[indexPath.row]
         cell.textLabel?.text = item.name // 5. load data to cell
         return cell
     }
     
     // MARK: - TableView Delegate Methods
     // 6. Action if cilck Cell
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         performSegue(withIdentifier: "gotoItems", sender: self)
     }
     
     // 7. prepare data befor  segue to the next ViewController
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         //var itemArray = [Categories]()
         // 6. set distination code tyo TodoListViewController
         let destinationVC = segue.destination as! TodoListViewController
         
         if let IndexPath = tableView.indexPathForSelectedRow {
             destinationVC.selectedCategory = itemArray[IndexPath.row]
         }
     }
     
     // MARK: - Add New Categories
     // Optional : Create add Category Popup
     @IBAction func clickAddNewCategory(_ sender: UIBarButtonItem) {
         // Optional : 1. Create text field
         var textField = UITextField()
         // Optional : 2. Create Popup window with title Add New Category
         let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
         // Optional : 3. Create Add Category BNT
         let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
             // Optional : 5. What will happen once the user clicks the AddItem button on our UIAlert
             let newCate = Categories(context: self.context)
             newCate.name = textField.text!
             self.itemArray.append(newCate)
             self.saveCategory()
             print("Save!")
         }
         // // Optional : 5. set placeholder to TextField
         alert.addTextField { (alertTextField) in
             alertTextField.placeholder = "CreateNew Category"
             textField = alertTextField
         }
         // Optional : 6. popup window
         alert.addAction(action)
         // Optional : 7. set Animation
         present(alert , animated: true, completion: nil)
     }
     
     // MARK: - Data Manipulatation Methods
     func saveCategory() {
         do {
             try context.save()
         } catch {
            print("Error saving context \(error)")
         }
         self.tableView.reloadData()
     }
      
     func loadCategories(with request: NSFetchRequest<Categories> =  Categories.fetchRequest())  {
         do {
             itemArray =  try context.fetch(request)
         } catch  {
             print("Error fetching data from context \(error)")
         }
         tableView.reloadData()
     }
     
 }


  

 */
