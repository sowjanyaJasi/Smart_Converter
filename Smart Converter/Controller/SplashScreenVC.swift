//
//  SplashScreenVC.swift
//  Smart Converter
//
//  Created by Sowjanya on 28/12/24.
//
import UIKit

class SplashScreenVC: UIViewController {

    @IBOutlet weak var splashView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        gotoLogin()
    }

    func gotoIntialVC() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            guard let currencyVC = self.getViewController(with: .currencyConvertVC, inStoryboard: .main) as? CurrencyConvertViewController else { return }
            self.pushVc(currencyVC)
        }
    }
    func gotoLogin() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            guard let currencyVC = self.getViewController(with: .loginVC, inStoryboard: .main) as? LoginViewController else { return }
            self.pushVc(currencyVC)
        }
    }
    
}
