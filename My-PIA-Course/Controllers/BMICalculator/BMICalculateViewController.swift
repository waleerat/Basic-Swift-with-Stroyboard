//
//  StrucAndClassViewController.swift
//  My PIA Lessons
//
//  Created by Waleerat Gottlieb on 2020-09-15.
//

import UIKit

struct BMIScale {
    func scale(bmiResult : Float) -> String {
        var returnText : String
        if bmiResult < 18.5 {
           returnText = "You are too thin!"
        } else if bmiResult < 24.9 {
            returnText = "You have a good shape!"
        }else{
            returnText = "You are too big!"
        }
        return returnText
    }
}

struct BMIBrain {
    //var scale = BMIScale()!
    mutating func calculateBMI(height: Float, weight: Float) -> Float {
        let heightInMeter = height/100
        let b =  weight / (heightInMeter * heightInMeter)
        return b
    }
}

class BMICalculateViewController: UIViewController {
    
    var bmiBrand = BMIBrain()
    var bmiResult : Float = 0.0
    
    @IBOutlet weak var yourWeight: UILabel!
    @IBOutlet weak var yourHeight: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        heightSlider.value = 150
        weightSlider.value = 30
        navigationItem.title = "BMI"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func heightSliderChange(_ sender: UISlider) {
        let height = String(format: "%.0f", sender.value)
        yourHeight.text = "\(height)cm"
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        yourWeight.text = "\(weight)kg"
    }
    
    @IBAction func getBMIResult(_ sender: UIButton) {
        let h = heightSlider.value
        let w = weightSlider.value
        bmiResult = bmiBrand.calculateBMI(height: h, weight: w)
    }
   
    
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "identifierGoToBMIResultScreen" {
        let destinationVC = segue.destination as! BMIResultViewController
        print(String(format: "%.2f", self.bmiResult ))
        destinationVC.bmiValue =  String(format: "%.2f", bmiResult )
    }
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
