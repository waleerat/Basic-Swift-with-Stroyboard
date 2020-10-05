//
//  WelcomeViewController.swift
//  authentication-IOS
//
//  Created by Waleerat Gottlieb on 2020-09-29.
//

import UIKit
import Firebase

class BasicManageDataViewController: UIViewController {
    
    let firebaseAuth = Auth.auth()
    let db = Firestore.firestore()
    
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var mobileNumberTextfield: UITextField!
    @IBOutlet weak var yourInfo: UILabel!
    @IBOutlet weak var welcomLabel: UILabel!
    var welcomeMessage: String = "Basic insert/update/delete"
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        navigationItem.title = "Welcome Page"
        welcomLabel.text = welcomeMessage
        self.yourInfo.text = ""
    }
    
    @IBAction func clickSaveInfoBnt(_ sender: UIButton) {
        restInfoLabel()
        if let email =  Auth.auth().currentUser?.email {
            let firstname = firstnameTextField.text!
            let lastname = lastnameTextField.text!
            if firstname != "" {
               db.collection(userInfo.collectionName)
                    .document(email)
                    .setData([
                        "firstname" : firstname,
                        "lastname": lastname,
                        "updated" : FieldValue.serverTimestamp()
                    ]) { (error) in
                        if let e = error {
                            self.welcomLabel.text = "There was an issue, \(e)"
                        }else{
                            self.welcomLabel.text = "saved!!"
                        }
                }
            }else{
                self.welcomLabel.text = "Input MobileNumber!!"
            }
        } else {
            navigationController?.popToRootViewController(animated: true)
        }
 
    }
    
    @IBAction func clickGetData(_ sender: UIButton) {
        restInfoLabel()

        if let email =  Auth.auth().currentUser?.email {
            db.collection(userInfo.collectionName).document(email).getDocument { (document, error) in
                if let document = document, document.exists {
                   // let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                    
                    print("--> \(dataDescription)")
                  
                    if let f = document.get("firstname") {
                        self.yourInfo.text! += "Name : \(String(describing: f)) "
                    }
                    if let l = document.get("lastname") {
                        self.yourInfo.text! += " \(String(describing: l)) "
                    }
                    if let m = document.get("mobile") {
                        self.yourInfo.text! += "Mobile : \(String(describing: m)) "
                    }
                     
                    self.yourInfo.textColor = UIColor.blue
                } else {
                    self.yourInfo.text = "Document does not exist"
                    self.yourInfo.textColor = UIColor.red
                }
            }
        }
       
        
    }
    
    
    @IBAction func clickUpdatePhoneNumberBnt(_ sender: UIButton) {
        restInfoLabel()
        if let email =  Auth.auth().currentUser?.email {
            let mobile = mobileNumberTextfield.text!
            if mobile != "" {
                db.collection(userInfo.collectionName)
                     .document(email)
                     .updateData([
                         "mobile" : mobile
                     ]) { (error) in
                         if let e = error {
                             self.welcomLabel.text = "There was an issue, \(e)"
                         }else{
                             self.welcomLabel.text = "MobileNumber Saved!!"
                         }
                 }
            }else{
                self.welcomLabel.text = "Input MobileNumber!!"
            }
        } else {
            navigationController?.popToRootViewController(animated: true)
        }
        
    }
    
    @IBAction func clickDeleteBnt(_ sender: UIButton) {
        restInfoLabel()
        if let email =  Auth.auth().currentUser?.email {
            db.collection(userInfo.collectionName).document(email).delete() { err in
                if let err = err {
                    self.welcomLabel.text = "Error removing document: \(err)"
                } else {
                    self.welcomLabel.text = "Document successfully removed!"
                }
            }
        }else {
            navigationController?.popToRootViewController(animated: true)
        }
        
    }
    
    @IBAction func LogoutBnt(_ sender: UIBarButtonItem) {
        do {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
            
            //let newViewController = HomeViewController()
            //navigationController?.pushViewController(newViewController, animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
 
    func restInfoLabel(){
        self.yourInfo.text = ""
    }
}

 
