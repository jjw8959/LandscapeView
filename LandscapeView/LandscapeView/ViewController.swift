//
//  ViewController.swift
//  LandscapeView
//
//  Created by woong on 1/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    var screenWidth = 0.0
    var screenHeight = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        collectionView = {
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.scrollDirection = .vertical
            
            collectionViewLayout.minimumLineSpacing = CGFloat(50)
            collectionViewLayout.minimumInteritemSpacing = CGFloat(10)
            collectionViewLayout.itemSize = CGSize(width: screenHeight / 4, height: screenHeight / 4)
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
            collectionView.delegate = self
            collectionView.dataSource = self
            return collectionView
        }()
        
        view.backgroundColor = .black
        
        collectionView.backgroundColor = .brown
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: screenWidth / 3),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
        ])
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.buttonImageAsset = "tmap"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("itemSelected\(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        if (collectionView.dataSource?.collectionView(collectionView, numberOfItemsInSection: 0))! < 7 {
            
        }
        return UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
    }
}

