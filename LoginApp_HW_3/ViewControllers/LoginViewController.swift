//
//  ViewController.swift
//  LoginApp_HW_3
//
//  Created by Артем Черненко on 15.12.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var forgotUsernameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let user = User.getUser()

// MARK: - LoginAction
    
    @IBAction func loginButtonPressed() {
        guard let inputText = usernameTextField.text, !inputText.isEmpty else {
            showMessage(title: "Error", message: "Enter username")
            return
        }
        guard let inputText = passwordTextField.text, !inputText.isEmpty else {
            showMessage(title: "Error", message: "Enter password")
            return
        }
    
        if usernameTextField.text == user.login , passwordTextField.text == user.password {
            //performSegue(withIdentifier: "segueWelcomeViewController", sender: self)
        } else {
            showMessage(title: "Login faild", message: "Incorrect username or password")
            passwordTextField.text = nil
        }
    }
  
// MARK: - ForgotButtonsMessages
    
    @IBAction func forgotButton(_ sender: UIButton) {
        
        sender.tag == 0
        ? showMessage(title: "Reminder", message: "Your password is: \(user.password)")
        : showMessage(title: "Reminder", message: "Your username is: \(user.login)")
    }
   
// MARK: - Segue forward and back
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let settingsWelcomeViewController = segue.destination as! WelcomeViewController
//        settingsWelcomeViewController.welcomeMessage = ("\(user.about.firstname) \(user.about.lastname)")
        let tabBarController = segue.destination as! UITabBarController
        let viewControllers = tabBarController.viewControllers
        for viewController in viewControllers! {
            if let welcomeViewController = viewController as? WelcomeViewController {
                welcomeViewController.welcomeMessage = user.about.firstname
                //any code for welcome
            } else if let navigationViewController = viewController as? UINavigationController {
                let personViewController = navigationViewController.topViewController as! PersonViewController
                //исправить
                
                personViewController.personFirstame = user.about.firstname
                personViewController.personLastname = user.about.lastname
                personViewController.personAge = user.about.age
                personViewController.personAbout = user.about.about
//добавить контакты
            }
        }
    }
    
    @IBAction func unwind(for segue:UIStoryboardSegue) {
        usernameTextField.text = nil
        passwordTextField.text = nil
    }
 
//MARK: - Keyboard hide and TextFields change tags
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
            view.endEditing(true)
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            loginButtonPressed()
            return true;
        }
        return false
    }
        
}

// MARK: - Extentions

extension LoginViewController {
    private func showMessage(title: String, message: String) {
        let message = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        message.addAction(okButton)
        present(message, animated: true)
    }
}

