//
//  LoginController.swift
//  Assignment 2 dialpad
//
//  Created by zeking on 11/23/20.
//

import UIKit

class LoginController:UIViewController, UITextFieldDelegate{
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var Login: UIButton!
    @IBOutlet var SignUp: UIButton!
    @IBOutlet var forgotPass:UIButton!
    @IBOutlet var errorLabel:UILabel!
    @IBOutlet var holderStack: UIStackView!
    let defEmail = "test@mail.com"
    let defPassword = "1234"
//    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doSetup()
       
    }
    func doSetup(){
        errorLabel.isHidden = true
        self.email.delegate = self
        self.password.delegate = self
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.email.becomeFirstResponder()
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        email.keyboardType = .emailAddress
        email.returnKeyType = .next
        view.addGestureRecognizer(tap)
    }
    override func viewDidLayoutSubviews() {
        self.addKeyBoardListeners()
    }
    @objc func dismissKeyboard(){
        if self.email .isFirstResponder{
            self.email.resignFirstResponder()
        }
        if self.password .isFirstResponder{
            self.password.resignFirstResponder()
        }
    }
    func addKeyBoardListeners(){
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleKeyBoardShow(notification:)),
            name: UIApplication.keyboardWillShowNotification,
            object:nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleKeyBoardhide(notification:)),
            name: UIApplication.keyboardWillHideNotification,
            object:nil)
    }
    
    @objc func handleKeyBoardShow(notification: Notification){
        print("skra")
//        guard let userInfo = notification.userInfo,
//              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
//              let endFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
//        else {return}
//        UIView.animate(withDuration: duration,
//                       animations: {
//                        self.holderStack. = UIEdgeInsets(
//                            top: 0,
//                            left: 0,
//                            bottom: endFrame.cgRectValue.height,
//                            right: 0)
//                       })
//
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
               if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height/2
               }
           }
    }
    @objc func handleKeyBoardhide(notification:Notification){
        print("ba")
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.changeTextFieldResponsibilty(textField)
//        textField.resignFirstResponder()
        return true
    }
    func changeTextFieldResponsibilty(_ textField: UITextField){
        switch textField {
        case self.email:
            self.password.becomeFirstResponder()
        default:
            self.password.resignFirstResponder()
            if(self.email.text == self.defEmail && self.password.text == self.defPassword){
                self.goToDialPad()
            }else{
                self.errorLabel.isHidden = false
                self.email.becomeFirstResponder()
            }
        }
    }
    @IBAction func goToDialPad(){
        if(self.email.text == self.defEmail && self.password.text == self.defPassword){
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            let dialPad = mainStoryBoard.instantiateViewController(identifier: "tabControllerId")
            dialPad.modalPresentationStyle = .overFullScreen
            self.present(dialPad, animated: true, completion: nil);
        }else{
            self.errorLabel.isHidden = false
            self.email.becomeFirstResponder()
        }
    }
    
}


