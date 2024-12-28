//
//  CustomTextFiled.swift
//  Smart Converter
//
//  Created by Sowjanya on 28/12/24.
//

import Foundation
import UIKit

protocol AmountTextFieldDelegate: AnyObject {
    func numberTextFieldDidEndEditing(_ textField: AmountTextField, value: String?)
}

class AmountTextField: UITextField {
    weak var numberDelegate: AmountTextFieldDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.keyboardType = .decimalPad
        self.delegate = self
        addDoneButtonToKeyboard()
        commonInit()
    }
    private func commonInit() {
        layer.cornerRadius = 5
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 4
        clipsToBounds = true
        backgroundColor = UIColor(red: 0.9, green: 0.95, blue: 1.0, alpha: 1.0)
        
    }
    private func addDoneButtonToKeyboard() {
           let doneToolbar = UIToolbar()
           doneToolbar.sizeToFit()
           
           let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
           let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
           
           doneToolbar.items = [flexSpace, doneButton]
           self.inputAccessoryView = doneToolbar
       }
       
       @objc private func doneButtonTapped() {
           numberDelegate?.numberTextFieldDidEndEditing(self, value: self.text)
           self.resignFirstResponder()
       }
}
class CustomTF: UITextField {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        setup(color:UIColor.red)
    }
    func setup(color: UIColor?) {
        // Set up the text field
             
               self.translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = "Enter text"
        self.borderStyle = .none
        self.textColor = UIColor.black
        
               // Add the line as a bottom border
               let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 40, width: self.frame.size.width - 32, height: 1) // Adjust width and y as needed
               bottomLine.backgroundColor = UIColor.lightGray.cgColor
        self.layer.addSublayer(bottomLine)
        
    }
    
}

extension AmountTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = textField.text,
              let textRange = Range(range, in: text) else { return false}
        
        let updatedText = text.replacingCharacters(in: textRange, with: string)
        if updatedText.count <= 6 {
            let allowedCharacterSet = CharacterSet(charactersIn: "0123456789.")
            return updatedText.rangeOfCharacter(from: allowedCharacterSet.inverted) == nil &&
            updatedText.components(separatedBy: ".").count <= 2
        }
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        numberDelegate?.numberTextFieldDidEndEditing(self, value: textField.text)
    }
}
