//
//  PlayViewController.swift
//  Mayan Secrets
//
//  Created by Ravil on 11.11.2023.
//

import UIKit

class PlayViewController: UIViewController {
    
    private let gameBack = UIImageView()
    private let pauseCard = UIImageView()
    private let continuePlayKekButton = UIButton()
    private let homePlayKekButton = UIButton()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        valueGameKey()
        setupTitleLawView()
    }
    
    private func valueGameKey() {
        view.addSubview(gameBack)
        view.addSubview(pauseCard)
        view.addSubview(continuePlayKekButton)
        view.addSubview(homePlayKekButton)
        
        gameBack.image = UIImage(named: "gameBack")
        gameBack.layer.masksToBounds = true
        gameBack.contentMode = .scaleAspectFill
        gameBack.translatesAutoresizingMaskIntoConstraints = false
        
        pauseCard.image = UIImage(named: "pauseCard")
        pauseCard.layer.masksToBounds = true
        pauseCard.contentMode = .scaleAspectFill
        pauseCard.isHidden = true
        pauseCard.translatesAutoresizingMaskIntoConstraints = false
        
        continuePlayKekButton.setImage(UIImage(named: "continue"), for: .normal)
        continuePlayKekButton.addTarget(self, action: #selector(continuePlayKekButtonKek), for: .touchUpInside)
        continuePlayKekButton.isHidden = true
        continuePlayKekButton.translatesAutoresizingMaskIntoConstraints = false
        
        homePlayKekButton.setImage(UIImage(named: "home"), for: .normal)
        homePlayKekButton.addTarget(self, action: #selector(homePlayKekButtonKek), for: .touchUpInside)
        homePlayKekButton.isHidden = true
        homePlayKekButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gameBack.topAnchor.constraint(equalTo: view.topAnchor),
            gameBack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gameBack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gameBack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            pauseCard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pauseCard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            homePlayKekButton.topAnchor.constraint(equalTo: pauseCard.topAnchor, constant: 135),
            homePlayKekButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            
            continuePlayKekButton.topAnchor.constraint(equalTo: pauseCard.topAnchor, constant: 135),
            continuePlayKekButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 20),
            
        ])
        
        if let backImage = UIImage(named: "continueButton")?.withRenderingMode(.alwaysOriginal) {
            let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(backButtonKek))
            navigationItem.leftBarButtonItem = backButton
        }
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc func backButtonKek() {
        gameBack.alpha = 0.4
        pauseCard.isHidden = false
        continuePlayKekButton.isHidden = false
        homePlayKekButton.isHidden = false
    }
    
    private func setupTitleLawView() {
        let titleImageView = UIImageView(image: UIImage(named: "level"))
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
    
    @objc func continuePlayKekButtonKek() {
        gameBack.alpha = 1
        pauseCard.isHidden = true
        continuePlayKekButton.isHidden = true
        homePlayKekButton.isHidden = true
    }
    
    @objc func homePlayKekButtonKek() {
        let controller = ImportantViewController()
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


