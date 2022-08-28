//
//  LifeStyleViewController.swift
//  CarrotMarket
//
//  Created by 김태현 on 2022/08/25.
//

import UIKit
import DropDown

class LifeStyleViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    
    // 상태바 하얀색
    override var preferredStatusBarStyle:UIStatusBarStyle { return .lightContent }
    
    @IBOutlet weak var dropDownBtn: UIButton!
    let dropDown = DropDown()
    
    let activities: [String] = ["같이해요","동네질문","동네맛집","동네소식","취미생활","분실/실종센터","동네사건사고","해주세요","일상","동네사진전","실시간 동네날씨"]

    @IBOutlet weak var activityCollectionView: UICollectionView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        setUpUI()
        setCollectionView()
        
        
    }
    
    
    
    
    func setUpUI() {
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
            dropDown.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
            // 모서리 둥글게
            dropDown.cornerRadius = 10
            // 선택한 값 가져오기
            dropDown.selectionAction = { [weak self] (index: Int, item: String) in
                print("선택한 아이템 : \(item)")
                print("인덱스 : \(index)")
                self?.dropDownBtn.setTitle(item, for: .normal)
            }
            
            
            // 리스트 뒷 배경 흐리게
            dropDown.dimmedBackgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 0.2)
            
        }
    
    @IBAction func dropDownTapped(_ sender: Any) {
        dropDown.show()
    }
    
    func setCollectionView() {
        activityCollectionView.backgroundColor = UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 1)
        activityCollectionView.showsHorizontalScrollIndicator = false
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LifeStyleFirstCollectionViewCell", for: indexPath) as! LifeStyleFirstCollectionViewCell
        
        let title = activities[indexPath.row]
        
        cell.titleLabel.text = title
        cell.titleLabel.textColor = .white
        cell.titleLabel.font = UIFont(name: "System", size: 14)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = CGColor.init(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        cell.layer.cornerRadius = 20
        
        
        
        return cell
    }
}

extension LifeStyleViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let name = self.activities[indexPath.row]
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]

        let nameSize = (name as NSString).size(withAttributes: attributes as [NSAttributedString.Key: Any])

        return CGSize(width: (nameSize.width) + 40, height: 40)
    }
}

