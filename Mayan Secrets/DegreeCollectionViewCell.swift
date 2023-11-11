//
//  LevelCollectionViewCell.swift
//  Mayan Secrets
//
//  Created by Ravil on 11.11.2023.
//

import UIKit

class DegreeCollectionViewCell: UICollectionViewCell {
    
    var degreeNonButtonTappedHandler: (() -> Void)?
    var degreeButtonTappedHandler: (() -> Void)?
    static let identificator = String(describing: DegreeCollectionViewCell.self)
    
    // MARK: - UI
    
    public lazy var levelButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(levelButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var levelCloseButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(levelCloseButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [levelButton, levelCloseButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            levelButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            levelButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            levelButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            levelButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            levelCloseButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            levelCloseButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            levelCloseButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            levelCloseButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    // MARK: - Actions
    
    @objc private func levelButtonTapped() {
        degreeButtonTappedHandler?()
    }
    
    @objc private func levelCloseButtonTapped() {
        degreeNonButtonTappedHandler?()
    }
}
