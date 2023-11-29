//
//  ViewController.swift
//  dbmslogin
//
//  Created by junseok on 11/29/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var alertLabel: UILabel!
    
    @IBAction func loginTouchUpInside(_ sender: Any) {
        guard let username = idTextField.text, !username.isEmpty else { return }
        guard let password = pwTextField.text, !password.isEmpty else { return }
        let loginSuccess: Bool = findUser(name: username, password: password)
        if loginSuccess {
            guard let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {return}
            loginVC.modalTransitionStyle = .coverVertical
            loginVC.modalPresentationStyle = .fullScreen
            loginVC.id = username
            loginVC.pw = password
            self.present(loginVC, animated: true, completion: nil)
        } else {
            alertLabel.text = "존재하지 않는 계정입니다."
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.alertLabel.text = "로그인"
            }
        }
    }
    
    @IBAction func signupTouchUpInside(_ sender: Any) {
        guard let signupVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else {return}
        signupVC.modalTransitionStyle = .coverVertical
        signupVC.modalPresentationStyle = .fullScreen
        self.present(signupVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func findUser(name: String, password: String) -> Bool {
        guard let userList: [[String:String]] = UserDefaults.standard.array(forKey: "UserList") as? [[String : String]] else { return false }
                UserDefaults.standard.object(forKey: "UserList")
                for userData in userList {
                    let memberID: String = userData["ID"]!
                    let memberPWD: String = userData["PWD"]!
                    if name == memberID && password == memberPWD {
                        return true
                    }
                }
                return false
    }


}

