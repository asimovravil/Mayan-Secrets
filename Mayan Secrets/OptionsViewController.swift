//
//  OptionsViewController.swift
//  Mayan Secrets
//
//  Created by Ravil on 11.11.2023.
//

import UIKit

struct MayanSecretsVariables {
    static var isVibrationOn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isVibrationOn")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isVibrationOn")
        }
    }
}

class OptionsViewController: UIViewController {
    
    var vibrationOptSuccess: Bool = false {
        didSet {
            changeVibration()
        }
    }
    
    var notificationOptSuccess: Bool = false {
        didSet {
            changeNotification()
        }
    }
    
    private let optionsBack = UIImageView()
    private let vibrationOptButton = UIButton()
    private let notificationOptButton = UIButton()
    private let privacyOptView = UIButton()
    private let shareOptView = UIButton()
    private let rateOptView = UIButton()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        valueOptionsKey()
        setupTitleOptionsView()
    }
    
    private func valueOptionsKey() {
        view.addSubview(optionsBack)
        view.addSubview(vibrationOptButton)
        view.addSubview(notificationOptButton)
        view.addSubview(privacyOptView)
        view.addSubview(shareOptView)
        view.addSubview(rateOptView)
        
        optionsBack.image = UIImage(named: "optionsBack")
        optionsBack.layer.masksToBounds = true
        optionsBack.contentMode = .scaleAspectFill
        optionsBack.translatesAutoresizingMaskIntoConstraints = false
        
        vibrationOptButton.setImage(UIImage(named: "nonsuccess"), for: .normal)
        vibrationOptButton.addTarget(self, action: #selector(vibrationOptButtonKek), for: .touchUpInside)
        vibrationOptButton.translatesAutoresizingMaskIntoConstraints = false
        
        notificationOptButton.setImage(UIImage(named: "nonsuccess"), for: .normal)
        notificationOptButton.addTarget(self, action: #selector(notificationOptButtonKek), for: .touchUpInside)
        notificationOptButton.translatesAutoresizingMaskIntoConstraints = false
        
        privacyOptView.setImage(UIImage(named: "privacy"), for: .normal)
        privacyOptView.translatesAutoresizingMaskIntoConstraints = false
        
        shareOptView.setImage(UIImage(named: "share"), for: .normal)
        shareOptView.addTarget(self, action: #selector(shareOptViewKek), for: .touchUpInside)
        shareOptView.translatesAutoresizingMaskIntoConstraints = false
        
        rateOptView.setImage(UIImage(named: "rate"), for: .normal)
        rateOptView.addTarget(self, action: #selector(rateOptViewKek), for: .touchUpInside)
        rateOptView.translatesAutoresizingMaskIntoConstraints = false
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                vibrationOptButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 420),
                rateOptView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -215),
                privacyOptView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 68),
                shareOptView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 68),
                rateOptView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 68),
            ])
        } else {
            NSLayoutConstraint.activate([
                vibrationOptButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 327),
                rateOptView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -125),
                privacyOptView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
                shareOptView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
                rateOptView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            ])
        }

        
        NSLayoutConstraint.activate([
            optionsBack.topAnchor.constraint(equalTo: view.topAnchor),
            optionsBack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            optionsBack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            optionsBack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            vibrationOptButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -68),
            
            notificationOptButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -68),
            notificationOptButton.topAnchor.constraint(equalTo: vibrationOptButton.bottomAnchor, constant: 4),
            
            privacyOptView.bottomAnchor.constraint(equalTo: shareOptView.topAnchor, constant: -13),
            
            shareOptView.bottomAnchor.constraint(equalTo: rateOptView.topAnchor, constant: -13),
        ])
        
        if let backImage = UIImage(named: "backControllerBack")?.withRenderingMode(.alwaysOriginal) {
            let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(backButtonKek))
            navigationItem.leftBarButtonItem = backButton
        }
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc func backButtonKek() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupTitleOptionsView() {
        let titleImageView = UIImageView(image: UIImage(named: "settings"))
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
    
    @objc func vibrationOptButtonKek() {
        vibrationOptSuccess.toggle()
    }
    
    func changeVibration() {
        let imageName = vibrationOptSuccess ? "success" : "nonsuccess"
        let image = UIImage(named: imageName)
        vibrationOptButton.setImage(image, for: .normal)
    }
    
    @objc func notificationOptButtonKek() {
        notificationOptSuccess.toggle()
    }
    
    func changeNotification() {
        let imageName = notificationOptSuccess ? "success" : "nonsuccess"
        let image = UIImage(named: imageName)
        notificationOptButton.setImage(image, for: .normal)
    }

    @objc private func shareOptViewKek() {
        let textToShare = "Check out this awesome app!"
        let appURL = URL(string: "https://www.yourappstorelink.com")!

        let activityViewController = UIActivityViewController(activityItems: [textToShare, appURL], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    @objc private func rateOptViewKek() {
        let appName = "Mayan Secrets"

        if let url = URL(string: "https://itunes.apple.com/search?term=\(appName)&entity=software") {
            let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                if let data = data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                           let results = json["results"] as? [[String: Any]],
                           let firstResult = results.first,
                           let appID = firstResult["trackId"] as? Int {
                            self.StoreApp(for: appID)
                        }
                    } catch {
                        print("JSON parsing error: \(error.localizedDescription)")
                    }
                }
            }
            task.resume()
        }
    }

    private func StoreApp(for appID: Int) {
        let appStoreURL = URL(string: "itms-apps://itunes.apple.com/app/id\(appID)?action=write-review")!

        if UIApplication.shared.canOpenURL(appStoreURL) {
            UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
        } else {
            print("Unable to open App Store URL")
        }
    }
}

enum MayanSecretsVibration {
    
    static func send(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        if MayanSecretsVariables.isVibrationOn {
            UINotificationFeedbackGenerator().notificationOccurred(type)
        }
    }
    
    static func select() {
        if MayanSecretsVariables.isVibrationOn {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        }
    }
}
