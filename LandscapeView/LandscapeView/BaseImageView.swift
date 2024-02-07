//
//  BaseImageView.swift
//  LandscapeView
//
//  Created by woong on 2/3/24.
//

import UIKit

class BaseImageView: UIImageView {

    var sourceImage: UIImage = UIImage() {
        didSet {
            self.image = sourceImage
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
