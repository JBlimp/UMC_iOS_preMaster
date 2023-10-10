//
//  RegisterViewController.swift
//  loginprac
//
//  Created by junseok on 10/4/23.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    //유효성검사를 위한 프로퍼티
    var isValidEmail = false
    
    var isValidName = false
    
    var isValidNickname = false
    
    var isValidPassword = false
    
    
    // Textfields
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            print("email")
        case nameTextField:
            print("name")
        case nicknameTextField:
            print("nickname")
        case passwordTextField:
            print("password")
        default:
            fatalError("Missing TextField...")
        }
    }
    
    // MARK: - Helpers
    private func setupTextField() {
        //프로퍼티와 액션을 연결
        
        //반복되는 코드를 간소화
        //emailTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: UIControl.Event)
        textFields.forEach { tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
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
