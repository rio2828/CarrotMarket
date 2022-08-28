//
//  ViewController.swift
//  CarrotMarket
//
//  Created by 김태현 on 2022/08/21.
//

import UIKit
import DropDown



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // 상태바 하얀색
    override var preferredStatusBarStyle:UIStatusBarStyle { return .lightContent }
    

    @IBOutlet weak var dropDownBtn: UIButton!
    let dropDown = DropDown()
    
    @IBOutlet weak var homeTableView: UITableView!

    
    let products = [("피식대학 황득근헬스교실 브로마이드 새상품 운포가"),("스타벅스 컵 일괄🤍"),("날씨의 아이 포토카드 세트"),("구찌 동전지갑"),("노트20 256GB 정상 해지된 기계 거래합니다^^")]
    let productImages = [UIImage(named: "home1"), UIImage(named: "home2"), UIImage(named: "home3"), UIImage(named: "home4"), UIImage(named: "home5")]
    let locations = ["서대문구 북아현동 ∙ 끌올 2분 전", "서대문구 북아현동 ∙ 끌올 3분 전", "마포구 염리동 ∙ 3분 전","공덕동 ∙ 2분 전","공덕동 ∙ 1일 전"]
    let prices = ["10,000원","5,000원","5,000원","40,000원","380,000원"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        
    }

    func setupUI() {
        
    // 드랍다운 리스트 설정
        dropDown.dataSource = ["신공덕동", "도화동", "용문동","내 동네 설정하기"]
        // 버튼에 붙이기
        dropDown.anchorView = dropDownBtn
        // 버튼 아래로 이동
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        // 너비
        dropDown.width = 150
        // 글자색
        dropDown.textColor = UIColor.lightGray
        // 선태된 글자 색
        dropDown.selectedTextColor = UIColor.white
        // 폰트사이즈
         dropDown.textFont = UIFont.systemFont(ofSize: 15)
        // 배경색
        dropDown.selectionBackgroundColor = UIColor.clear
        dropDown.backgroundColor = UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 1)
        // 모서리 둥글게
        dropDown.cornerRadius = 10
        // 선택한 값 가져오기
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in
            print("선택한 아이템 : \(item)")
            print("인덱스 : \(index)")
            self?.dropDownBtn.setTitle(item, for: .normal)
        }
        
        
        // 리스트 뒷 배경 흐리게
        dropDown.dimmedBackgroundColor = UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 0.2)
        
        // 테이블뷰 구분선 색깔
        homeTableView.separatorColor = .lightGray
        
        
    }

    @IBAction func dropDownTapped(_ sender: Any) {
        dropDown.show()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        let productTitle = products[indexPath.row]
        let images = productImages[indexPath.row]
        let location = locations[indexPath.row]
        let price = prices[indexPath.row]
        
        cell.titleLabel.text = productTitle
        cell.photo.image = images
        cell.locationLabel.text = location
        cell.priceLabel.text = price
        
        cell.titleLabel.textColor = .white
        
        cell.backgroundColor = UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 1)
        cell.layer.borderWidth = 0
        
        // 테이블뷰 위 여백 제거
//        var frame = CGRect.zero
//        frame.size.height = .leastNormalMagnitude
//        tableView.tableHeaderView = UIView(frame: frame)
        
        
        return cell
    }
}


