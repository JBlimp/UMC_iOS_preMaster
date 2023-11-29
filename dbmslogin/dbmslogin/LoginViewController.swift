//
//  LoginViewController.swift
//  dbmslogin
//
//  Created by junseok on 11/29/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var currentId: UILabel!
    @IBOutlet weak var currentPw: UILabel!


    @IBAction func logoutButtonTouchUpInside(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    var id: String?
    var pw: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let id = id else {return}
        guard let pw = pw else {return}
        self.currentId.text = "id: " + id
        self.currentPw.text = "pw: " + pw
        self.currentId.sizeToFit()
        self.currentPw.sizeToFit()
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
