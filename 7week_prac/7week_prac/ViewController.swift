//
//  ViewController.swift
//  7week_prac
//
//  Created by junseok on 11/22/23.
//

import UIKit
import KakaoSDKUser

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var kakaoLoginButton: UIButton!
    
    @IBAction func kakaoLoginButtonTouchUpInside(_ sender: Any) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            
            //카톡 설치되어있으면 -> 카톡으로 로그인
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("카카오 톡으로 로그인 성공")
                    
                    _ = oauthToken
                    /// 로그인 관련 메소드 추가
                }
            }
        } else {
            
            // 카톡 없으면 -> 계정으로 로그인
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("카카오 계정으로 로그인 성공")
                    
                    _ = oauthToken
                    // 관련 메소드 추가
                    
                    UserApi.shared.me { user, error in
                        if let error = error {
                            print(error)
                        } else {
                            let profileImageURL = user?.kakaoAccount?.profile?.profileImageUrl
                            let nickname = user?.kakaoAccount?.profile?.nickname
                            self.presentProfile(profileURL: profileImageURL, nickname: nickname)
                        }
                    }
                }
            }
        }
    }
    
    private func presentProfile(profileURL: URL?, nickname: String?) {
        guard let imageData = try? Data(contentsOf: profileURL!) else {return}
        
        profileImage.image = UIImage(data: imageData)
        nameLabel.text = nickname
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

