//
//  TableViewViewController.swift
//  My PIA Lessons
//
//  Created by Waleerat Gottlieb on 2020-09-15.
//

import UIKit

class TableViewViewController: UIViewController, UITableViewDataSource {
    
    var peopleNames = [String]()
    @IBOutlet weak var nameListTV: UITableView!
    @IBOutlet weak var inputPersonField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Table View"
        nameListTV.dataSource = self
        // Do any additional setup after loading the view.
       
        peopleNames.append("James")
        peopleNames.append("James02")
        peopleNames.append("James03")
        
    }

    
    @IBAction func clickAddToList(_ sender: UIButton) {
        
        if inputPersonField.text == "" {
            return
        }
        
        peopleNames.append(inputPersonField.text!)
        nameListTV.reloadData()
        inputPersonField.text = ""
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        peopleNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell") as! TableViewTableViewCell
      
        cell.personItem.text = peopleNames[indexPath.row]
        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
