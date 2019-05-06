//
//  SignUp.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 5/4/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import Foundation
import Firebase

class SignUp: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    private var heightPicker: UIPickerView?
    private var weightPicker: UIPickerView?
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightPicker = UIPickerView()
        heightPicker?.delegate = self
        heightPicker?.dataSource = self
        heightPicker?.selectRow(100, inComponent: 0, animated: true)
        
        weightPicker = UIPickerView()
        weightPicker?.delegate = self
        weightPicker?.dataSource = self
        weightPicker?.selectRow(50, inComponent: 0, animated: true)
        
        heightTextField.inputView = heightPicker
        weightTextField.inputView = weightPicker
        
        ref = Database.database().reference()
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text, let weight = weightTextField.text, let height = heightTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let err = error {
                    let alertController = UIAlertController(title: "Error", message: err.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    self.ref.child("Users").child((authResult?.user.uid)!).setValue(["fullName": name, "weight": [Double(weight)], "height": Double(height)])
                    let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as UIViewController
                    self.present(rootVC, animated: true, completion: nil)
                }
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == heightPicker {
            return 300
        } else {
            return 500
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == heightPicker {
            heightTextField.text = String(row)
        } else {
            weightTextField.text = String(row)
        }
    }
}
