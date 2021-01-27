//
//  ViewController.swift
//  InsatagramClone
//
//  Created by Asit Aslan on 27.01.2021.
//  Copyright © 2021 Asit Aslan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInCliclked(_ sender: Any) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
        
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        
    }
}

