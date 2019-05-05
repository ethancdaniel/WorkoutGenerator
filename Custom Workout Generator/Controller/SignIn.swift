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
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func signInPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
                guard let strongSelf = self else { return }
                if let err = error {
                    let alertController = UIAlertController(title: "Error", message: err.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    strongSelf.present(alertController, animated: true, completion: nil)
                } else {
                    strongSelf.performSegue(withIdentifier: "signInToHome", sender: self)
                }
            }
        }
    }
    @IBAction func signUpPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToSignUp", sender: self)
    }
}
