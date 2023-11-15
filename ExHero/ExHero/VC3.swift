//
//  VC3.swift
//  ExHero
//
//  Created by Jake.K on 2022/02/24.
//

import UIKit
import Lottie

class VC3: UIViewController {
  private let dismissButton: UIButton = {
    let button = UIButton()
    button.setTitle("back", for: .normal)
    button.setTitleColor(.white, for: .normal)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .systemBlue
      
      let animationView: LottieAnimationView = .init(name: "animation")
      self.view.addSubview(animationView)
      
      animationView.frame = self.view.bounds
      animationView.center = self.view.center
      animationView.contentMode = .scaleAspectFit
      animationView.loopMode = .loop
      animationView.play()
    
    self.view.addSubview(self.dismissButton)
    self.dismissButton.translatesAutoresizingMaskIntoConstraints = false
    self.dismissButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
      self.dismissButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
    self.dismissButton.addTarget(self, action: #selector(didTapDismissButton), for: .touchUpInside)
    
  }
  
  @objc private func didTapDismissButton() {
    self.dismiss(animated: true)
  }
}
