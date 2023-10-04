//
//  LoginViewController.swift
//  loginprac
//
//  Created by junseok on 10/4/23.
//

import UIKit

class LoginViewController: UIViewController {

    var email = String()
    var password = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        //Optional
        //??를 통해 기본값 지정
        let text = sender.text ?? ""
        self.email = text
    }

    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
        print("test")
    }
    
    @IBAction func loginButtonDidTab(_ sender: UIButton) {
    }
    
    @IBAction func registerButtonDidTab(_ sender: UIButton) {
        //화면전환
        //1. 스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //2. 뷰컨트롤러 생성
        //identifier 항목의 뷰 id를 이용하여 접근
        let registerViewController = storyboard.instantiateViewController(identifier: "RegisterVC") as! RegisterViewController
        //3. 화면전환 메서드를 이용해서 화면을 전환
        //animated: 애니메이션 출력유무, completion: 화면전환 후 실행할 동작
//        self.present(registerViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
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
