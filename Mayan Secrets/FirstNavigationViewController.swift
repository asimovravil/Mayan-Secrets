//
//  FirstNavigationViewController.swift
//  Mayan Secrets
//
//  Created by Ravil on 10.11.2023.
//

import UIKit

class FirstNavigationViewController: UIViewController {
    
    private let backbackbacksplash = UIImageView()
    private let lololoading = UIImageView()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        valueKey()
    }
    
    private func valueKey() {
        [backbackbacksplash, lololoading].forEach() {
            view.addSubview($0)
        }
        circleLogicSplashAnimation()
        
        lololoading.image = UIImage(named: "lololoading")
        lololoading.layer.masksToBounds = true
        lololoading.contentMode = .scaleAspectFill
        lololoading.translatesAutoresizingMaskIntoConstraints = false
        
        backbackbacksplash.image = UIImage(named: "backbackbacksplash")
        backbackbacksplash.layer.masksToBounds = true
        backbackbacksplash.contentMode = .scaleAspectFill
        backbackbacksplash.translatesAutoresizingMaskIntoConstraints = false
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                lololoading.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -190)
            ])
        } else {
            NSLayoutConstraint.activate([
                lololoading.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120)
            ])
        }
        NSLayoutConstraint.activate([
            backbackbacksplash.topAnchor.constraint(equalTo: view.topAnchor),
            backbackbacksplash.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backbackbacksplash.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backbackbacksplash.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            lololoading.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    private func circleLogicSplashAnimation() {
        let fastFullAnimation = CGFloat(Double.pi * 2)
        let splashLoadAnim = CABasicAnimation(keyPath: "transform.rotation")
        splashLoadAnim.fromValue = 0.0
        splashLoadAnim.toValue = fastFullAnimation
        splashLoadAnim.duration = 1.0
        splashLoadAnim.repeatCount = .greatestFiniteMagnitude
        self.lololoading.layer.add(splashLoadAnim, forKey: "360rotation")
    }
}


