//
//  LoginViewController.swift
//  Smart Converter
//
//  Created by Sowjanya on 28/12/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var tfEmail: CustomTF!
    @IBOutlet weak var tfPwd: CustomTF!
    
    @IBOutlet weak var vwLogin: UIView!
    @IBOutlet weak var ivLogo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vwLogin.layer.cornerRadius = 35
        tfEmail.setup(color: UIColor.red)
        tfPwd.setup(color: UIColor.red)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        if validateFields() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                guard let currencyVC = self.getViewController(with: .currencyConvertVC, inStoryboard: .main) as? CurrencyConvertViewController else { return }
                self.pushVc(currencyVC)
            }
        }
        
        
    }
    func validateFields() -> Bool {
            guard let email = tfEmail.text, !email.isEmpty else {
                self.showAlert(message: "Email cannot be empty.")
                return false
            }
            
            guard let password = tfPwd.text, !password.isEmpty else {
                showAlert(message: "Password cannot be empty.")
                return false
            }
            
        if !Utility.isValidEmail(email) {
                showAlert(message: "Please enter a valid email address.")
                return false
            }
            return true
        }
    
    
}
