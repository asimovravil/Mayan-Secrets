//
//  BuyViewController.swift
//  Mayan Secrets
//
//  Created by Ravil on 11.11.2023.
//

import UIKit

class BuyViewController: UIViewController {
    
    private let shopBack = UIImageView()
    private let coinYellowKekImageView = UIImageView()
    private let coinPrice = UILabel()
    private let livesLogo = UIImageView()
    private let coin50 = UIImageView()
    private let coin200 = UIImageView()
    private let coin50Button = UIButton()
    private let coin200Button = UIButton()
    private let wallpapersImage = UIImageView()
    private let wallpapersButton = UIButton()
    private let heartImage = UIImageView()
    private let heartKekLabel = UILabel()
    
    public lazy var heartKekStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartImage, heartKekLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        valueLawKey()
        setupTitleLawView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let coinPriceLolKek = UserDefaults.standard.integer(forKey: "coinPriceLolKek")
        coinPrice.text = "\(coinPriceLolKek)"
    }
    
    private func valueLawKey() {
        view.addSubview(shopBack)
        view.addSubview(coinYellowKekImageView)
        view.addSubview(coinPrice)
        view.addSubview(livesLogo)
        view.addSubview(coin50)
        view.addSubview(coin200)
        view.addSubview(coin50Button)
        view.addSubview(coin200Button)
        view.addSubview(wallpapersImage)
        view.addSubview(wallpapersButton)
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
        
        shopBack.image = UIImage(named: "buyBack")
        shopBack.layer.masksToBounds = true
        shopBack.contentMode = .scaleAspectFill
        shopBack.translatesAutoresizingMaskIntoConstraints = false
        
        coinYellowKekImageView.image = UIImage(named: "coin")
        coinYellowKekImageView.layer.masksToBounds = true
        coinYellowKekImageView.contentMode = .scaleAspectFill
        coinYellowKekImageView.translatesAutoresizingMaskIntoConstraints = false
        
        coinPrice.text = "0"
        coinPrice.font = UIFont(name: "Stick-Regular", size: 24)
        coinPrice.textColor = .white
        coinPrice.translatesAutoresizingMaskIntoConstraints = false
        
        livesLogo.image = UIImage(named: "livesLogo")
        livesLogo.layer.masksToBounds = true
        livesLogo.contentMode = .scaleAspectFill
        livesLogo.translatesAutoresizingMaskIntoConstraints = false
        
        coin50.image = UIImage(named: "coin50")
        coin50.layer.masksToBounds = true
        coin50.contentMode = .scaleAspectFill
        coin50.translatesAutoresizingMaskIntoConstraints = false
        
        coin200.image = UIImage(named: "coin200")
        coin200.layer.masksToBounds = true
        coin200.contentMode = .scaleAspectFill
        coin200.translatesAutoresizingMaskIntoConstraints = false
        
        coin50Button.setImage(UIImage(named: "buyNonSuccess"), for: .normal)
        coin50Button.translatesAutoresizingMaskIntoConstraints = false
        
        coin200Button.setImage(UIImage(named: "buyNonSuccess"), for: .normal)
        coin200Button.translatesAutoresizingMaskIntoConstraints = false
        
        wallpapersImage.image = UIImage(named: "wallpapers")
        wallpapersImage.layer.masksToBounds = true
        wallpapersImage.contentMode = .scaleAspectFill
        wallpapersImage.translatesAutoresizingMaskIntoConstraints = false
        
        wallpapersButton.setImage(UIImage(named: "buyNonSuccess"), for: .normal)
        wallpapersButton.addTarget(self, action: #selector(wallpapersButtonKek), for: .touchUpInside)
        wallpapersButton.translatesAutoresizingMaskIntoConstraints = false
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                coinYellowKekImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 176),
                coinPrice.topAnchor.constraint(equalTo: view.topAnchor, constant: 169),
            ])
        } else {
            NSLayoutConstraint.activate([
                coinYellowKekImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 96),
                coinPrice.topAnchor.constraint(equalTo: view.topAnchor, constant: 89),
            ])
        }
        
        NSLayoutConstraint.activate([
            shopBack.topAnchor.constraint(equalTo: view.topAnchor),
            shopBack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shopBack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            shopBack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            coinYellowKekImageView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -5),
            
            coinPrice.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 1),

            livesLogo.topAnchor.constraint(equalTo: coinYellowKekImageView.bottomAnchor, constant: 32),
            livesLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 72),
            
            coin50.topAnchor.constraint(equalTo: livesLogo.bottomAnchor, constant: 20),
            coin50.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 72),
            
            coin200.topAnchor.constraint(equalTo: coin50.bottomAnchor, constant: 20),
            coin200.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 72),
            
            coin50Button.topAnchor.constraint(equalTo: livesLogo.bottomAnchor, constant: 23),
            coin50Button.leadingAnchor.constraint(equalTo: coin50.trailingAnchor, constant: 46),
            
            coin200Button.topAnchor.constraint(equalTo: coin50Button.bottomAnchor, constant: 20),
            coin200Button.leadingAnchor.constraint(equalTo: coin200.trailingAnchor, constant: 35),
            
            wallpapersImage.topAnchor.constraint(equalTo: coin200.bottomAnchor, constant: 32),
            wallpapersImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 72),
            
            wallpapersButton.topAnchor.constraint(equalTo: wallpapersImage.bottomAnchor, constant: -15),
            wallpapersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -76),
        ])
        
        if let backImage = UIImage(named: "backControllerBack")?.withRenderingMode(.alwaysOriginal) {
            let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(backButtonKek))
            navigationItem.leftBarButtonItem = backButton
        }
        
        let coinWalletBarButtonItem = UIBarButtonItem(customView: heartKekStackView)
        navigationItem.rightBarButtonItem = coinWalletBarButtonItem
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc func backButtonKek() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupTitleLawView() {
        let titleImageView = UIImageView(image: UIImage(named: "shop"))
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
    
    @objc func wallpapersButtonKek() {
        let alert = UIAlertController(title: "Not Enough Coins", message: "You need at least coins to accept this item.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


