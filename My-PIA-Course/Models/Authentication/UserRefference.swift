//
//  UserRefference.swift
//  authentication-IOS
//
//  Created by Waleerat Gottlieb on 2020-09-30.
//

import Foundation
import Firebase
 
struct UserRefference {
    let email: String
    let uid: NSString
    let refId: Int
    
    static let collectionName = "userRefId"
    struct fieldName {
        static let uid = "uid"
        static let refId = "refId"
    }
}

struct UserAuthen {
    let email: String
    let password: String
}


class UserAuthenClass {
    func register(){
        print("_____-register-_______")
    }
    /*
    if let email = emailTextField.text, let password = passwordTextField.text {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                // show error to Register Screen
                self.errorLabel.text = "error : \(e)"
            }else{
                // get refference ID
                self.performSegue(withIdentifier: "segueAfterRegister" , sender: self)
            }
        }
    }else{
        errorLabel.text = "Input Email and Password"
    }*/
}



class UserRefferenceClass {
    let db = Firestore.firestore()
    
    private func getNewRefferenceId() -> String {
        return "12345"
    }
    
    func saveRefference() {
        let email =  Auth.auth().currentUser?.email
        let uid =  Auth.auth().currentUser?.uid
        
        db.collection(UserRefference.collectionName)
            .document(email!)
            .setData([
                UserRefference.fieldName.uid : uid!,
                UserRefference.fieldName.refId : self.getNewRefferenceId()
            ])
   }
}
