//
//  SignUpViewController.swi/Users/newnew/Desktop/UMC_iOS_preMaster/dbmslogin/dbmslogin/ViewController.swiftft
//  dbmslogin
//
//  Created by junseok on 11/29/23.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var alertLabel: UILabel!
    
    @IBOutlet weak var pwconfirmTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    
    @IBAction func signupTouchUpInside(_ sender: Any) {
        guard let username = idTextField.text else {return}
        guard let password = pwTextField.text else {return}
        guard let conformpwd = pwconfirmTextField.text else {return}
        
        if password == conformpwd {
            var userList: [[String: String]]
            if let tempList = UserDefaults.standard.array(forKey: "UserList") as? [[String:String]] {
                            userList = tempList
                        } else {
                            userList = []
                        }
            
            let userData: [String:String] = ["ID":username, "PWD":password]
                        userList.append(userData)
                        UserDefaults.standard.set(userList, forKey: "UserList")
            
            alertLabel.text = "회원가입이 완료되었습니다"
            
        } else {
            alertLabel.text = "비밀번호 확인을 다시 입력하세요"
        }
        
    }
    
    @IBAction func cancelTouchUpInside(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
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
