//
//  Controller+Extension.swift
//  Smart Converter
//
//  Created by Sowjanya on 28/12/24.
//

import Foundation
import UIKit

var defaults = UserDefaults.standard
let nCenter = NotificationCenter.default


enum StoryboardIdentifiers: String {
    case splashScreenVC =  "SplashScreenVC"
    case intialVC = "IntialVC"
    case currencyConvertVC = "CurrencyConvertVC"
    case loginVC = "LoginVC"
}

enum StoryboardNames: String {
    case main = "Main"
}

extension UIViewController {
    func pushToController(with storyboardID:StoryboardIdentifiers, inStoryboard name:StoryboardNames){
        DispatchQueue.main.async {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: name.rawValue, bundle: nil)
            let newViewcontroller:UIViewController = mainstoryboard.instantiateViewController(withIdentifier:storyboardID.rawValue)
            self.navigationController?.pushViewController(newViewcontroller, animated: true)
        }
    }
    func presentToController(with storyboardID:StoryboardIdentifiers, inStoryboard name:StoryboardNames){
        DispatchQueue.main.async {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: name.rawValue, bundle: nil)
            let newViewcontroller:UIViewController = mainstoryboard.instantiateViewController(withIdentifier:storyboardID.rawValue)
            newViewcontroller.modalPresentationStyle = .fullScreen
            self.present(newViewcontroller, animated: true)
            
        }
    }
    
    func getViewController(with storyboardID:StoryboardIdentifiers, inStoryboard name:StoryboardNames)-> UIViewController{
        let mainstoryboard:UIStoryboard = UIStoryboard(name: name.rawValue, bundle: nil)
        let newViewcontroller:UIViewController = mainstoryboard.instantiateViewController(withIdentifier:storyboardID.rawValue)
        return newViewcontroller
    }
   
    @IBAction func pushBackToPreviousController(){
        self.navigationController?.popViewController(animated: true)
    }
    func pushVc(_ vc : UIViewController){
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func showNavigation() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    func showAlert(message: String) {
           let alert = UIAlertController(title: "Validation Error", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default))
           present(alert, animated: true, completion: nil)
       }
}
