//
//  ImageViewController.swift
//  My PIA Lessons
//
//  Created by Waleerat Gottlieb on 2020-09-15.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickChangeImg(_ sender: UIButton) {
        let bntTitle = sender.currentTitle!
        switch bntTitle {
        case "Beach":
            bgImage.image = #imageLiteral(resourceName: "imageView-beach")
            txtTitle.text = "Beach"
        case "Landscape":
            bgImage.image = #imageLiteral(resourceName: "imageView-landscape")
            txtTitle.text = "Landscape"
        default:
            bgImage.image = #imageLiteral(resourceName: "background-image-screen")
            txtTitle.text = "Default"
         
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
