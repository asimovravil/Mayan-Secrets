//
//  DefeatViewController.swift
//  Mayan Secrets
//
//  Created by Ravil on 11.11.2023.
//

import UIKit

class DefeatViewController: UIViewController {
    
    private let defeaBack = UIImageView()
    private let homeLoseKekButton = UIButton()
    private let repeatLoseKekButton = UIButton()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        valueVictoryKey()
    }
    
    private func valueVictoryKey() {
        view.addSubview(defeaBack)
        view.addSubview(homeLoseKekButton)
        view.addSubview(repeatLoseKekButton)
        
        defeaBack.image = UIImage(named: "loseBack")
        defeaBack.layer.masksToBounds = true
        defeaBack.contentMode = .scaleAspectFill
        defeaBack.translatesAutoresizingMaskIntoConstraints = false
        
        homeLoseKekButton.setImage(UIImage(named: "home"), for: .normal)
        homeLoseKekButton.addTarget(self, action: #selector(homePlayLoseButtonKek), for: .touchUpInside)
        homeLoseKekButton.translatesAutoresizingMaskIntoConstraints = false
        
        repeatLoseKekButton.setImage(UIImage(named: "repeat"), for: .normal)
        repeatLoseKekButton.addTarget(self, action: #selector(repeatLoseKekButtonKek), for: .touchUpInside)
        repeatLoseKekButton.translatesAutoresizingMaskIntoConstraints = false
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                homeLoseKekButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -290),
                repeatLoseKekButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -290),
            ])
        } else {
            NSLayoutConstraint.activate([
                homeLoseKekButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
                repeatLoseKekButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            ])
        }
        
        NSLayoutConstraint.activate([
            defeaBack.topAnchor.constraint(equalTo: view.topAnchor),
            defeaBack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            defeaBack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            defeaBack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            homeLoseKekButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            
            repeatLoseKekButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 20),
        ])
    }
    
    @objc private func homePlayLoseButtonKek() {
        let controller = ImportantViewController()
        controller.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func repeatLoseKekButtonKek() {
        let controller = DegreeViewController()
        controller.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(controller, animated: true)
    }
}


