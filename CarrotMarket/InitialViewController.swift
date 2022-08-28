//
//  InitialViewController.swift
//  CarrotMarket
//
//  Created by 김태현 on 2022/08/23.
//

import UIKit

class InitialViewController: UIViewController {
    
    // 상태바 하얀색
    override var preferredStatusBarStyle:UIStatusBarStyle { return .lightContent }
    
    
    @IBOutlet weak var startBtn: UIButton!
    
    @IBOutlet weak var logInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        
    }
    
    func setupUI() {
        

        startBtn.layer.masksToBounds = true
        startBtn.layer.cornerRadius = 10
        
    }
    

 
    @IBAction func startBtnPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(identifier: "UINavigationController") as! UINavigationController
        

        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        
        present(viewController, animated: false)
        
    }
    
    @IBAction func logInBtnPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(identifier: "VerifyNavigationController") as! UINavigationController
        

        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        
        present(viewController, animated: false)
        
        
        
        
        
        
        
        
    }
}
