//
//  BMIResultViewController.swift
//  My-PIA-Course
//
//  Created by Waleerat Gottlieb on 2020-10-01.
//

import UIKit

class BMIResultViewController: UIViewController {

    var bmiValue: String?
    
    @IBOutlet weak var bmiResultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiResultLabel.text = bmiValue
        navigationItem.title = "BMI Result"
        // Do any additional setup after loading the view.
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
