//
//  ViewController.swift
//  LoginForm
//
//  Created by Praveen Reddy on 01/09/20.
//  Copyright © 2020 Praveen Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txfName: TextfiledCommonFile!
    @IBOutlet weak var txfpassword: TextfiledCommonFile!
    
    @IBOutlet weak var progressImage: UIImageView!
    
    @IBAction func btnAceLogin(_ sender: UIButton) {
    }
    @IBInspectable var allowedCharInString: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let seqvenceimgae = [UIImage(named: "Amma"),UIImage(named: "PraveenReddy"),UIImage(named: "Amma"),UIImage(named: "PraveenReddy")]
        progressImage.animationImages = seqvenceimgae as? [UIImage]
        progressImage.animationDuration = 1.0
        progressImage.startAnimating()
       firstImgSet()
        secondImgeSet()
        txfName.delegate = self
        txfpassword.delegate = self
        txfName.valueType = .phoneNumber
        txfName.maxLength = 12
        
     
        
    }

   
    func firstImgSet()
    {
        let imageView = UIImageView()
        let image12 = UIImage(named: "User")
        imageView.image = image12
        txfName.leftViewMode = UITextField.ViewMode.always
        txfName.leftViewMode = .always
        txfName.leftView = imageView
    }
    
    func secondImgeSet()
    {
        let imageviewsecond = UIImageView()
        let imagepassword = UIImage(named: "Password")
        imageviewsecond.image = imagepassword
        txfpassword.leftViewMode = UITextField.ViewMode.always
        txfpassword.leftViewMode = .always
        txfpassword.leftView = imageviewsecond
    }
}

extension ViewController:UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        // Verify all the conditions
        if let sdcTextField = textField as? TextfiledCommonFile {
            return sdcTextField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        return true
    }
     
  
    
  



}
