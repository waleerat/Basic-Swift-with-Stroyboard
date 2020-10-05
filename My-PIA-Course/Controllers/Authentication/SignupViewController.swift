//
//  SignupViewController.swift
//  My-PIA-Course
//
//  Created by Waleerat Gottlieb on 2020-10-01.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {

    let db = Firestore.firestore()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var ErrorLabel: UILabel!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        ErrorLabel.text =  ""
        navigationItem.title = "Register"
    }
    
    
    @IBAction func ClickRegister(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        //if let email = emailTextField.text, let password = passwordTextField.text {  // Question
        if email != "" && password != "" {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    // show error to Register Screen
                    self.ErrorLabel.text = "error : \(e)"
                }else{
                    self.performSegue(withIdentifier: "segueAfterRegister" , sender: self)
                }
            }
        }else{
            ErrorLabel.text = "Input Email and Password"
        }
    
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as! BasicManageDataViewController
        welcomeVC.welcomeMessage = "Hello From Register"
    }
    
 
}
/*
 
 // Save refference ID
 self.db.collection(UserRefId.collectionName)
     .order(by: UserRefId.fieldName.created, descending: true)
     .limit(to: 1)
     .getDocuments { (snapshot, error) in
         if let snapshortDocument = snapshot?.documents {
             if snapshortDocument.count > 0 {
                 //let refId = snapshortDocument[0].refId
                 refId = 55
             }
         }
     }
 */
