//
//  ViewController.swift
//  loginandpassword
//
//  Created by Robert  Tregaskes on 5/1/17.
//  Copyright © 2017 Robert  Tregaskes. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var signInSelector: UISegmentedControl!
    
    @IBOutlet weak var signInLabel: UILabel!

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!

    var isSignIn:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        
        isSignIn = !isSignIn
        
        if isSignIn {
            signInLabel.text = "Sign In"
            signInButton.setTitle("Sign In ", for: .normal)
        }
        else {
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
            
        }
        
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
        if let email = emailTextField.text, let pass = passwordTextField.text {
            
            if isSignIn {
            
                FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: { (user, errror) in
                    
                    if user != nil {
                        
                        self.performSegue(withIdentifier: "goToSplash", sender: self)
                        
                    }
                    else {
                
                    }
            
                })
            
            }
            else {
                
                FIRAuth.auth()?.createUser(withEmail: email, password: pass, completion: { (user, error) in
                    
                    if user != nil {
                        
                         self.performSegue(withIdentifier: "goToSplash", sender: self)
                        
                    }
                    else {
                        
                    }
                    
                })
            
            
            }
        
        
        }
        
        
    }
    
    
}

