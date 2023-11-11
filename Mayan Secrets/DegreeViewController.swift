//
//  DegreeViewController.swift
//  Mayan Secrets
//
//  Created by Ravil on 11.11.2023.
//

import UIKit

class DegreeViewController: UIViewController {

    let sections: [DegreeType] = [.degrees]
    private var selectedLevel: Int?
        
    private let backgroundView = UIImageView()

    private lazy var mainCollectionView: UICollectionView = {
        let layout = degreeLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        valueDegreeKey()
        setupTitleDegreeView()
    }
    
    private func valueDegreeKey() {
        view.addSubview(backgroundView)
        view.addSubview(mainCollectionView)
        
        backgroundView.image = UIImage(named: "levelsBack")
        backgroundView.layer.masksToBounds = true
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        mainCollectionView.register(LevelCollectionViewCell.self, forCellWithReuseIdentifier: LevelCollectionViewCell.reuseID)
        mainCollectionView.showsVerticalScrollIndicator = false
        mainCollectionView.showsHorizontalScrollIndicator = false
        mainCollectionView.backgroundColor = .clear
        mainCollectionView.isUserInteractionEnabled = true
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo:   view.bottomAnchor),
            
            mainCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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
    
    private func setupTitleDegreeView() {
        let titleImageView = UIImageView(image: UIImage(named: "levels"))
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
    
    private func additionalDegreeItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(43)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .topLeading
        )
    }
    
    private func degreeLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            let section = self?.sections[sectionIndex] ?? .degrees
            switch section {
            case .degrees:
                return self?.degreesSectionLayout()
            }
        }
    }
        
    private func degreesSectionLayout() -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3), // Один из трех элементов в строке
            heightDimension: .absolute(85)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.trailing = 16 // Расстояние между элементами
        
        // Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(85)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item, item, item]
        )
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16 // Расстояние между группами (строками)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 24,
            bottom: 16,
            trailing: 0
        )
        section.boundarySupplementaryItems = [additionalDegreeItem()]
        return section
    }
}

extension DegreeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        switch section {
        case .degrees:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LevelCollectionViewCell.reuseID,
                for: indexPath
            ) as? LevelCollectionViewCell else {
                fatalError("Could not cast to LevelCollectionViewCell")
            }
            let levelIndex = indexPath.row + 1
            
            if levelIndex >= 1 && levelIndex <= 5 {
                let imageName = "level\(levelIndex)"
                cell.levelButton.setBackgroundImage(nil, for: .normal)
                cell.levelCloseButton.isHidden = true
                if let image = UIImage(named: imageName) {
                    cell.levelButton.setBackgroundImage(image, for: .normal)
                }
            } else if levelIndex >= 6 {
                var imageName: String?
                switch levelIndex {
                case 6...24: imageName = "closeLevel"
                default: break
                }

                if let imageName = imageName, let image = UIImage(named: imageName) {
                    cell.levelButton.setBackgroundImage(image, for: .normal)
                }
            } else {
                cell.levelButton.setBackgroundImage(nil, for: .normal)
            }
            return cell
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = sections[section]
        switch section {
        case .degrees:
            return 24
        }
    }
}

enum DegreeType {
    case degrees
}
