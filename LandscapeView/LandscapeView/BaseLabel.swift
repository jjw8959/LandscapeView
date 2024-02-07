//
//  BaseLabel.swift
//  LandscapeView
//
//  Created by woong on 2/2/24.
//

import UIKit

class BaseLabel: UILabel {
    
    var labelText: String = "" {
        didSet {
            self.text = labelText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .center
        self.adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
