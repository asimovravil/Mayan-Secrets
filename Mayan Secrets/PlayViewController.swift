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
    private let shadowShamanCell1 = UIImageView()
    private let shadowShamanCell2 = UIImageView()
    private let kingCell1 = UIImageView()
    private let kingCell2 = UIImageView()

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
        view.addSubview(shadowShamanCell1)
        view.addSubview(shadowShamanCell2)
        view.addSubview(kingCell1)
        view.addSubview(kingCell2)
        
        gameBack.image = UIImage(named: "gameBack")
        gameBack.layer.masksToBounds = true
        gameBack.contentMode = .scaleAspectFill
        gameBack.translatesAutoresizingMaskIntoConstraints = false
        
        pauseCard.image = UIImage(named: "pauseCard")
        pauseCard.layer.masksToBounds = true
        pauseCard.contentMode = .scaleAspectFill
        pauseCard.isHidden = true
        pauseCard.translatesAutoresizingMaskIntoConstraints = false
        
        shadowShamanCell1.image = UIImage(named: "shadowshamanCell")
        shadowShamanCell1.layer.masksToBounds = true
        shadowShamanCell1.contentMode = .scaleAspectFill
        shadowShamanCell1.translatesAutoresizingMaskIntoConstraints = false
        
        shadowShamanCell2.image = UIImage(named: "shadowshamanCell")
        shadowShamanCell2.layer.masksToBounds = true
        shadowShamanCell2.contentMode = .scaleAspectFill
        shadowShamanCell2.translatesAutoresizingMaskIntoConstraints = false
        
        kingCell1.image = UIImage(named: "kingCell")
        kingCell1.layer.masksToBounds = true
        kingCell1.contentMode = .scaleAspectFill
        kingCell1.translatesAutoresizingMaskIntoConstraints = false
        
        kingCell2.image = UIImage(named: "kingCell")
        kingCell2.layer.masksToBounds = true
        kingCell2.contentMode = .scaleAspectFill
        kingCell2.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            shadowShamanCell1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 94),
            shadowShamanCell1.bottomAnchor.constraint(equalTo: shadowShamanCell2.topAnchor, constant: -190),
            
            shadowShamanCell2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 94),
            shadowShamanCell2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -192),
            
            kingCell1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -94),
            kingCell1.bottomAnchor.constraint(equalTo: kingCell2.topAnchor, constant: -190),
            
            kingCell2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -94),
            kingCell2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -192),
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
