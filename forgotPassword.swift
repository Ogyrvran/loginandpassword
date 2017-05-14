//
//  forgotPassword.swift
//  loginandpassword
//
//  Created by Robert  Tregaskes on 5/13/17.
//  Copyright © 2017 Robert  Tregaskes. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class forgotPassword: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!

    @IBAction func enterButtonTapped(_ sender: UIButton) {
        
        FIRAuth.auth()?.sendPasswordReset(withEmail: emailTextField.text!) { (error) in
            
            if error == nil {
                
                self.performSegue(withIdentifier: "goToLogIn", sender: self)
                
            }
            else {
                
            }

            
        }
    
        
    }

    
}






