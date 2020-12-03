//
//  ViewController.swift
//  DeliveryApp
//
//  Created by Oleh Haidar on 07.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailFiled: UITextField!
    @IBOutlet weak var passwordFIeld: UITextField!
    @IBOutlet weak var lblValidationMessage: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    


    @IBAction func continueBtn(_ sender: Any) {
        
        let theButton = sender as! UIButton
        let bounds = theButton.bounds
        
        
//        MARK: - func animation
        
        func errorValidateAnimation() {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 20, options: .curveEaseInOut, animations: {
                theButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            }) { (success: Bool) in
                if success {
                    theButton.bounds = bounds
                }
            }
            
            UIView.animate(withDuration: 1, delay: 0.0, options: [.autoreverse,.repeat, .curveEaseOut],
                animations: {
                    self.lblValidationMessage.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                },
                completion: { _ in
                    self.lblValidationMessage.transform = .identity
                }
            )
            
        }
    
//        MARK: - validation
        
        func validateEmail(email: String) -> (ok :Bool, msg :String) {
            var isOk = true
            var errorMsg = String()
            if email.count == 0  {
                errorMsg = "Please enter your email"
                isOk = false
                errorValidateAnimation()
            } else if email.count < 5  {
                errorMsg = "Invalid email"
                isOk = false
                errorValidateAnimation()
            }
            return(isOk, errorMsg)
        }
        
        func validatePassword(password: String) -> (ok :Bool, msg :String) {
            var isOk = true
            var errorMsg = String()
            if password.count == 0  {
                errorMsg = "Please enter your password"
                isOk = false
                errorValidateAnimation()
            } else if password.count < 5  {
                errorMsg = "Your password has less than 5 letters"
                isOk = false
                errorValidateAnimation()
            }
            
            let simplePasswords = ["qwerty", "12345", "qazwsx", "11111", "qwerty12345"]
            for simplePassword in simplePasswords {
                if password == simplePassword {
                    errorMsg = "Your password too easy to guess"
                    isOk = false
                    errorValidateAnimation()
                }
            }
            return(isOk, errorMsg)
        }
        
        let validate1 = validateEmail(email: emailFiled.text!)
        let validate2 = validatePassword(password: passwordFIeld.text!)
        
        
        if validate1.ok == false {
            lblValidationMessage.textColor = .red
            lblValidationMessage.isHidden = false
            lblValidationMessage.text = validate1.msg
            return
            
        } else if validate2.ok == false {
            lblValidationMessage.textColor = .red
            lblValidationMessage.isHidden = false
            lblValidationMessage.text = validate2.msg
            return
        }
        lblValidationMessage.text = "Success!"
        lblValidationMessage.textColor = .green
        //performSegue(withIdentifier: "showMain", sender: self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(identifier: "MainVC")
        navigationController?.setViewControllers([mainViewController], animated: true)
                
        
    }
    

}

