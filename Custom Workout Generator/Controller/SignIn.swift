//
//  SignIn.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 5/4/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import Foundation
import Firebase

class SignIn: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func signInPressed(_ sender: UIButton) {
    
    }
    @IBAction func signUpPressed(_ sender: UIButton) {
    performSegue(withIdentifier: "segueToSignUp", sender: self)
    }
}
