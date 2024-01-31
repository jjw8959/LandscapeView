//
//  CollectionViewCell.swift
//  LandscapeView
//
//  Created by woong on 1/29/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CollectionViewCell"
    
    let buttonImage: UIImageView = UIImageView()
    
    var buttonImageAsset: String = "" {
        didSet {
            buttonImage.image = UIImage(named: buttonImageAsset)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonImage.contentMode = .scaleAspectFit
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonImage)
        
        NSLayoutConstraint.activate([
            buttonImage.topAnchor.constraint(equalTo: self.topAnchor),
            buttonImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            buttonImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonImage.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
