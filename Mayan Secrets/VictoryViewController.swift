//
//  VictoryViewController.swift
//  Mayan Secrets
//
//  Created by Ravil on 11.11.2023.
//

import UIKit

class VictoryViewController: UIViewController {
    
    private let winBack = UIImageView()
    private let homeWinKekButton = UIButton()
    private let nextLevelWinKekButton = UIButton()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        valueVictoryKey()
    }
    
    private func valueVictoryKey() {
        view.addSubview(winBack)
        view.addSubview(homeWinKekButton)
        view.addSubview(nextLevelWinKekButton)
        
        winBack.image = UIImage(named: "winBack")
        winBack.layer.masksToBounds = true
        winBack.contentMode = .scaleAspectFill
        winBack.translatesAutoresizingMaskIntoConstraints = false
        
        homeWinKekButton.setImage(UIImage(named: "home"), for: .normal)
        homeWinKekButton.addTarget(self, action: #selector(homePlayKekButtonKek), for: .touchUpInside)
        homeWinKekButton.translatesAutoresizingMaskIntoConstraints = false
        
        nextLevelWinKekButton.setImage(UIImage(named: "nextLevel"), for: .normal)
        nextLevelWinKekButton.addTarget(self, action: #selector(nextLevelWinKekButtonKek), for: .touchUpInside)
        nextLevelWinKekButton.translatesAutoresizingMaskIntoConstraints = false
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                homeWinKekButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -290),
                nextLevelWinKekButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -290),
            ])
        } else {
            NSLayoutConstraint.activate([
                homeWinKekButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
                nextLevelWinKekButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            ])
        }
        
        NSLayoutConstraint.activate([
            winBack.topAnchor.constraint(equalTo: view.topAnchor),
            winBack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            winBack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            winBack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            homeWinKekButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            
            nextLevelWinKekButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 20),
        ])
    }
    
    @objc private func homePlayKekButtonKek() {
        let controller = ImportantViewController()
        controller.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func nextLevelWinKekButtonKek() {
        let controller = DegreeViewController()
        controller.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(controller, animated: true)
    }
}


