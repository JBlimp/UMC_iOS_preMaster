//
//  ViewController.swift
//  carrotmarket
//
//  Created by junseok on 10/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    let name = ["닌텐도 스위치", "찰리푸스 토요일", "보아 앨범(마이 네임, 허리케인 비너스)", "아이폰14프로", "아이브 포토카드", "아이바네즈 기타", "스타벅스 아메리카노", "먹태깡 2봉지", "서울랜드 종일권이 이가격?", "에어팟 맥스 실버 풀박", "글랜피딕 게임박스", "청담동 주차자리 팝니다", "크래프터 통기타"]
    let locate = ["잠원동 . 끌올 1시간 전", "신사동 . 44분 전", "성동구 . 55초 전", "성수1가제1동 . 1시간 전", "신사동 . 1시간 전", "압구정동 . 끌올 1시간 전", "청담동 . 1시간 전", "잠원동 . 2시간 전", "성수동1가 . 1시간 전", "반포3동 . 2시간 전", "압구정동 . 2시간 전", "청담동 . 끌올 3시간 전", "잠원동 . 3시간 전"]
    let price = ["289,000", "250,000", "나눔", "125만원", "5000원", "180만원", "4000원", "6000원", "16,000원", "52,000원", "10,000원", "200,000원", "100,000원"]
    let heart = ["2", "1", "24", "0", "1", "0", "3", "0", "0", "1", "1", "1", "1"]
    let message = ["6", "4", "38", "4", "5", "2", "1", "0", "0", "1", "9", "2", "3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath) as! MyTestTableViewCell
        cell.nameLabel.text = name[indexPath.row]
        cell.locateLabel.text = locate[indexPath.row]
        cell.priceLabel.text = price[indexPath.row]
        cell.heartLabel.text = heart[indexPath.row]
        cell.messageLabel.text = message[indexPath.row]
        return cell
    }
    
    
}
