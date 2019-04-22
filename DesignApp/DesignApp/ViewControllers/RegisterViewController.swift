//
//  RegisterViewController.swift
//  DesignApp
//
//  Created by Maksim Shershun on 3/30/19.
//  Copyright © 2019 Maksim Shershun. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var registerButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextFields()
        setupTextFieldDelegates()
        moveKeyboard()
        
        registerLabel.addTextSpacing(spacing: 7)
    }
    
    private func setupTextFieldDelegates() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    private func setupTextFields() {
        nameTextField.layer.cornerRadius = 4
        emailTextField.layer.cornerRadius = 4
        usernameTextField.layer.cornerRadius = 4
        passwordTextField.layer.cornerRadius = 4
        confirmPasswordTextField.layer.cornerRadius = 4
        registerButtonOutlet.layer.cornerRadius = 4
    }
    
    private func moveKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name:UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name:UIResponder.keyboardWillHideNotification, object: nil);
    }

    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -175
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func registerButton(_ sender: UIButton) {
        print("Register Button pressed")
    }
}
