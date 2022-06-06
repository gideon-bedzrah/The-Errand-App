//
//  SignupViewController.swift
//  The Errand App
//
//  Created by Gideon Bedzrah on 14/04/2021.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstName.delegate = self; lastName.delegate = self
        emailField.delegate = self
        phoneNumber.delegate = self
        passwordField.delegate = self
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    
    }
    
    @IBAction func backButtonTappped(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = .zero
            scrollView.scrollsToTop = true
            scrollView.isScrollEnabled = false
        } else {
            scrollView.isScrollEnabled = true
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: (keyboardViewEndFrame.height + 170) - view.safeAreaInsets.bottom, right: 0)
        }
        
        scrollView.scrollIndicatorInsets = scrollView.contentInset

    }
}

extension SignupViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstName:
            lastName.becomeFirstResponder()
        case lastName:
            emailField.becomeFirstResponder()
        case emailField:
            phoneNumber.becomeFirstResponder()
        case phoneNumber:
            passwordField.becomeFirstResponder()
        default:
            scrollView.scrollsToTop = true
            textField.resignFirstResponder()
        }
        return true
    }
    
}
