//
//  LawViewController.swift
//  Mayan Secrets
//
//  Created by Ravil on 11.11.2023.
//

import UIKit

class LawViewController: UIViewController {
    
    private let lawBack = UIImageView()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        valueKey()
        setupTitleView()
    }
    
    private func valueKey() {
        view.addSubview(lawBack)
        
        lawBack.image = UIImage(named: "lawBack")
        lawBack.layer.masksToBounds = true
        lawBack.contentMode = .scaleAspectFill
        lawBack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lawBack.topAnchor.constraint(equalTo: view.topAnchor),
            lawBack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lawBack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lawBack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        if let backImage = UIImage(named: "backControllerBack")?.withRenderingMode(.alwaysOriginal) {
            let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(backButtonTapped))
            navigationItem.leftBarButtonItem = backButton
        }
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupTitleView() {
        let titleImageView = UIImageView(image: UIImage(named: "rules"))
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
}


