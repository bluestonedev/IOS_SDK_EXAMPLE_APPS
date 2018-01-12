//
// BasicAuthViewController.swift
// Authentication
//
// Created by HCP SDK for iOS Assistant application on 18/11/16
//

import UIKit
import SAPCommon

class BasicAuthViewController: UIViewController, URLSessionTaskDelegate, UITextFieldDelegate {

    private let logger: Logger = Logger.shared(named: "BasicAuthViewController")

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var activeTextField: UITextField?
    
    var loginHandler : ((String, String) -> Void)!

    @IBAction func loginButtonTapped(_ sender: AnyObject) {

        // Validate the input Fields
        guard let username = self.usernameTextField.text, username.characters.count > 0,
              let password = self.passwordTextField.text, password.characters.count > 0  else {
            displayAlert(title: "Error", message: "Username or Password is invalid", buttonText: "Ok")
            return
        }
        
        loginHandler(username, password)

        self.dismiss(animated: true)
    }
    
    func displayAlert(title: String, message: String, buttonText: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // Create the actions
        let buttonAction = UIAlertAction(title: buttonText, style: .default) {
            UIAlertAction in
            alertController.dismiss(animated: true, completion: nil)
        }
        // Add the actions
        alertController.addAction(buttonAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }


    override func viewDidLoad() {
    }

    // MARK: UITextFieldDelegate

    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.activeTextField?.resignFirstResponder()
        return true
    }
    

}
