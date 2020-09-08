//
//  TextfiledCommonFile.swift
//  LoginForm
//
//  Created by Praveen Reddy on 05/09/20.
//  Copyright © 2020 Praveen Reddy. All rights reserved.
//

import Foundation
import UIKit

enum VaueType:Int {
   case none
   case onlyletters
   case onlyNumbers
   case phoneNumber
   case alphanumaric
   case fullname
}

class TextfiledCommonFile:UITextField{
    
    @IBInspectable var maxLength:Int = 0 // mac Charecter length
    var valueType:VaueType = VaueType.none // Allowed Characters
    
    @IBInspectable var allowedCharString: String = ""
    
    func verifyFields(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        switch valueType {
        case .none:
            break // do nothing
        case .onlyletters:
            let characterSet = CharacterSet.letters
            if string.rangeOfCharacter(from: characterSet.inverted) != nil {
                return false
            }
        case .onlyNumbers:
            let numberSet = CharacterSet.decimalDigits
            if string.rangeOfCharacter(from: numberSet) != nil
            {
                return false
            }
        case.phoneNumber:
            let phoneNumberSet = CharacterSet(charactersIn: "+0123456789")
            if string.rangeOfCharacter(from: phoneNumberSet.inverted) != nil{
                
                return false
            }
        case .alphanumaric:
                let alphaNumericSet = CharacterSet.alphanumerics
                if string.rangeOfCharacter(from: alphaNumericSet.inverted) != nil {
                    return false
                }
                
        case .fullname:
                var characterSet = CharacterSet.letters
                print(characterSet)
                characterSet = characterSet.union(CharacterSet(charactersIn: " "))
                if string.rangeOfCharacter(from: characterSet.inverted) != nil {
                    return false
                }
            }
        if let text  = self.text, let textRange = Range(range, in: text){
            
            let finalText = text.replacingCharacters(in: textRange, with: string)
            
            if maxLength > 0 , maxLength < finalText.utf8.count
            {
                return false
            }
        }
            
        if !self.allowedCharString.isEmpty {
            let customSet = CharacterSet(charactersIn: self.allowedCharString)
                       if string.rangeOfCharacter(from: customSet.inverted) != nil {
                           return false
                       }
            
        }
        
    return true
    }
}

