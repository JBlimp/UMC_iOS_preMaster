//
//  ClickViewController.swift
//  bamin
//
//  Created by junseok on 11/8/23.
//

import UIKit

struct info {
    var dow : Bool?
    var size : Bool?
}

class ClickViewController: UIViewController {
    
    var Info : info = info(dow: false, size: false)
    
    //미디엄: false, 라지: true
    @IBAction func priceMedium(_ sender: UIButton) {
        Info.size = false
    }
    
    @IBAction func priceLarge(_ sender: UIButton) {
        Info.size = true
    }
    
    @IBAction func priceCrust(_ sender: UIButton) {
        Info.dow = true
    }
    
    @IBAction func buttonSend(_ sender: UIButton) {
        //화면전환
        //1. 스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //2. 뷰컨트롤러 생성
        //identifier 항목의 뷰 id를 이용하여 접근
        let priceViewController = storyboard.instantiateViewController(identifier: "PriceViewController") as! PriceViewController
        //3. data 푸시
        priceViewController.Info = self.Info
        //4. 화면전환 메서드를 이용해서 화면을 전환
        //animated: 애니메이션 출력유무, completion: 화면전환 후 실행할 동작
        
        self.navigationController?.pushViewController(priceViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
