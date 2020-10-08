//
//  UploadImageViewController.swift
//  My-PIA-Course
//
//  Created by Waleerat Gottlieb on 2020-10-06.
//

import UIKit
import Photos
import FirebaseStorage
import Firebase
import FirebaseUI

class UploadImageViewController: UIViewController {
    var imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imagePickerController.sourceType = .photoLibrary
        self.present(self.imagePickerController, animated:  true, completion:  nil)
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
