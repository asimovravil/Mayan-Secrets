//
//  ImportantViewController.swift
//  Mayan Secrets
//
//  Created by Ravil on 11.11.2023.
//

import UIKit

class ImportantViewController: UIViewController {

    private let importantBack = UIImageView()
    private let avatar = UIImageView()
    private let but1button = UIButton()
    private let but2button = UIButton()
    private let but3button = UIButton()
    private let but4button = UIButton()
    private let heartImage = UIImageView()
    private let heartKekLabel = UILabel()
    
    public lazy var heartKekStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartImage, heartKekLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        valueImportantKey()
    }
    
    private func valueImportantKey() {
        view.addSubview(importantBack)
        view.addSubview(avatar)
        view.addSubview(but1button)
        view.addSubview(but2button)
        view.addSubview(but3button)
        view.addSubview(but4button)
        view.addSubview(heartKekStackView)
        
        heartImage.image = UIImage(named: "heart")
        heartImage.layer.masksToBounds = true
        heartImage.contentMode = .scaleAspectFill
        heartImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        heartImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        heartKekLabel.text = "0"
        heartKekLabel.font = UIFont(name: "Stick-Regular", size: 24)
        heartKekLabel.textColor = .white
        heartKekLabel.translatesAutoresizingMaskIntoConstraints = false
        
        importantBack.image = UIImage(named: "importantBack")
        importantBack.layer.masksToBounds = true
        importantBack.contentMode = .scaleAspectFill
        importantBack.translatesAutoresizingMaskIntoConstraints = false
        
        avatar.image = UIImage(named: "avatar")
        avatar.layer.masksToBounds = true
        avatar.contentMode = .scaleAspectFill
        avatar.translatesAutoresizingMaskIntoConstraints = false
        
        but1button.setImage(UIImage(named: "but1button"), for: .normal)
        but1button.addTarget(self, action: #selector(but1buttonKek), for: .touchUpInside)
        but1button.translatesAutoresizingMaskIntoConstraints = false

        but2button.setImage(UIImage(named: "but2button"), for: .normal)
        but2button.addTarget(self, action: #selector(but2buttonKek), for: .touchUpInside)
        but2button.translatesAutoresizingMaskIntoConstraints = false

        but3button.setImage(UIImage(named: "but3button"), for: .normal)
        but3button.addTarget(self, action: #selector(but3buttonKek), for: .touchUpInside)
        but3button.translatesAutoresizingMaskIntoConstraints = false

        but4button.setImage(UIImage(named: "but4button"), for: .normal)
        but4button.addTarget(self, action: #selector(but4buttonKek), for: .touchUpInside)
        but4button.translatesAutoresizingMaskIntoConstraints = false
        
        let coinWalletBarButtonItem = UIBarButtonItem(customView: heartKekStackView)
        navigationItem.rightBarButtonItem = coinWalletBarButtonItem
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                avatar.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
                but4button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -85),
            ])
        } else {
            NSLayoutConstraint.activate([
                avatar.topAnchor.constraint(equalTo: view.topAnchor, constant: -40),
                but4button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            ])
        }
        
        NSLayoutConstraint.activate([
            importantBack.topAnchor.constraint(equalTo: view.topAnchor),
            importantBack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            importantBack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            importantBack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            avatar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20),
            avatar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            
            but1button.bottomAnchor.constraint(equalTo: but2button.topAnchor, constant: -24),
            but1button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            but2button.bottomAnchor.constraint(equalTo: but3button.topAnchor, constant: -24),
            but2button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            but3button.bottomAnchor.constraint(equalTo: but4button.topAnchor, constant: -24),
            but3button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            but4button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func but1buttonKek() {
        let controller = DegreeViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func but2buttonKek() {
        let controller = BuyViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func but3buttonKek() {
        let controller = LawViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func but4buttonKek() {
        let controller = OptionsViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
