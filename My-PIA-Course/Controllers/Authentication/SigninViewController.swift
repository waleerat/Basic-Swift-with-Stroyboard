//
//  SigninViewController.swift
//  My-PIA-Course
//
//  Created by Waleerat Gottlieb on 2020-10-01.
//

import UIKit
import Firebase

class SigninViewController: UIViewController {

    @IBOutlet weak var TextFieldPassword: UITextField!
    @IBOutlet weak var TextFieldEmail: UITextField!
    @IBOutlet weak var LabelError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LabelError.text = ""
        navigationItem.title = "Login"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ClickLoginBnt(_ sender: UIButton) {
        let email = TextFieldEmail.text!
        let password = TextFieldPassword.text!
        
        //if let email = emailTextField.text, let password = passwordTextField.text {  // Question
        if email != "" && password != "" {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.LabelError.text = "\(e.localizedDescription)"
                    self.LabelError.textColor = UIColor.red
                }else{
                    // navigate to PersonalViewController with identifier : ActionFromRegisterScreen
                    self.performSegue(withIdentifier: "segueAfterLogin" , sender: self)
                }
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let welcomeVC = segue.destination as! BasicManageDataViewController
        //welcomeVC.welcomeMessage = "Hello From Login"
    }

}
