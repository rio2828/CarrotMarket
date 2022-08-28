//
//  phoneVerifyView.swift
//  CarrotMarket
//
//  Created by 김태현 on 2022/08/23.
//

import UIKit
import AnyFormatKit

class PhoneVerifyView: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var getSMSVerify: UIButton!
    
    // 상태바 하얀색
    override var preferredStatusBarStyle:UIStatusBarStyle { return .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
//        numInserted()
        numberTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        numberTextField.addTarget(self, action: #selector(textFieldDidTouched(_:)), for: .allTouchEvents)
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
    }
    
    func setUpUI() {
        numberTextField.keyboardType = .phonePad
        numberTextField.textColor = .white
        getSMSVerify.layer.cornerRadius = 10

    }

    @IBAction func backBtnTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(identifier: "InitialViewController") as! InitialViewController
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        
        present(viewController, animated: false)
    }
    
    
    

    @objc func textFieldDidTouched(_ textField: UITextField) {
        textField.layer.borderColor = .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = numberTextField.text else {return}
        if text.count >= 10 {
            getSMSVerify.titleLabel?.textColor = .white
            getSMSVerify.backgroundColor = UIColor(red: 251/255, green: 104/255, blue: 41/255, alpha: 1)
        }
    }
    


}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
    
    


