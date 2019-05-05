//
//  SignUp.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 5/4/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import Foundation
import Firebase

class SignUp: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    @IBAction func signUpPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let err = error {
                    let alertController = UIAlertController(title: "Error", message: err.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    self.ref.child("Users").child((authResult?.user.uid)!).setValue(["fullName": name])
                    self.performSegue(withIdentifier: "signUpToHome", sender: self)
                }
            }
        }
    }
}
