//
//  startBtnPressedView.swift
//  CarrotMarket
//
//  Created by 김태현 on 2022/08/23.
//

import UIKit

class StartBtnPressedView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // 상태바 하얀색
    override var preferredStatusBarStyle:UIStatusBarStyle { return .lightContent }
    
 
    @IBOutlet var searchBarView: UISearchBar!
    
    @IBOutlet weak var backBtn: UIBarButtonItem!
    
    @IBOutlet weak var currentLocationBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
        tableView
        
        
    }
    
    func setUpUI() {
        
        // 서치바 설정
        navigationItem.titleView = searchBarView
        searchBarView.barTintColor = UIColor(red: 35, green: 35, blue: 35, alpha: 1)
        searchBarView.keyboardType = .default
        searchBarView.tintColor = .lightGray
        
        // 현재위치로 찾기 버튼 설정
        currentLocationBtn.layer.masksToBounds = true
        currentLocationBtn.layer.cornerRadius = 10
        
        // 테이블뷰 UI

        
        tableView.backgroundColor = UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 1)
        tableView.showsVerticalScrollIndicator = false

    }
    
    
    
    
    
    @IBAction func backBtnTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(identifier: "InitialViewController") as! InitialViewController
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        
        present(viewController, animated: false)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell", for: indexPath)
        let address: [String] = ["서울 마포구 신공덕동","서울 마포구 도화동", "서울 용산구 도원동", "서울 용산구 용문동", "서울 용산구 효창동", "서울 용산구 신창동", "서울 용산구 산천동","서울 마포구 염리동", "서울 마포구 원효로제2동", "서울 마포구 공덕동", "서울 용산구 원효로3가", "서울 마포구 마포동", "서울 용산구 청암동","서울 용산구 원효로2가", "서울 용산구 원효로4가", "서울 용산구 원효로5가","서울 마포구 신공덕동","서울 마포구 도화동", "서울 용산구 도원동", "서울 용산구 용문동"]
        
        cell.backgroundColor = UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 1)
        cell.textLabel?.textColor = .white
        
        cell.textLabel?.text = address[indexPath.row]

        
        
        return cell
    }
    
    
}
