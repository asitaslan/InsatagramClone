//
//  ViewController.swift
//  InsatagramClone
//
//  Created by Asit Aslan on 27.01.2021.
//  Copyright © 2021 Asit Aslan. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
    }

    @IBAction func signInCliclked(_ sender: Any) {
        if emailTxt.text != "" && passwordTxt.text != ""{
            Auth.auth().signIn(withEmail: emailTxt.text!, password: passwordTxt.text!) { (authdata, error) in
                if error != nil{
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error" )
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else{
            makeAlert(titleInput: "Error!", messageInput: "Chechk Your Email and Password")
        }
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if emailTxt.text != "" && passwordTxt.text != ""{
            
            Auth.auth().createUser(withEmail: emailTxt.text!, password: passwordTxt.text!) { (authdata, error) in
                if error != nil{
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error" )
                    
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        else{
            makeAlert(titleInput: "Error", messageInput: "Username/password")
        }
        
       
        
        
    }
    func makeAlert(titleInput:String, messageInput:String){
               
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
               
               let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil )
               alert.addAction(okButton)
               self.present(alert, animated: true , completion: nil)
               
    }
}

