//
//  TableViewCell.swift
//  LandscapeView
//
//  Created by woong on 2/4/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier: String = "TableViewCell"
    
    let appListStore: AppListStore = AppListStore()
    
    private let myTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let toggleSwitch: UISwitch = {
        let toggleSwitch = UISwitch()
        toggleSwitch.translatesAutoresizingMaskIntoConstraints = false
        toggleSwitch.isUserInteractionEnabled = true
        return toggleSwitch
    }()
    
    var labelText: String = "" {
        didSet {
            myTextLabel.text = labelText
            
            // Set the switch state from UserDefaults
            let safeKey = labelText
            let switchState = UserDefaults.standard.bool(forKey: safeKey)
            toggleSwitch.isOn = switchState
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(myTextLabel)
        self.contentView.addSubview(toggleSwitch)
        
        toggleSwitch.addTarget(self, action: #selector(toggledSwitch), for: UIControl.Event.valueChanged)
        
        NSLayoutConstraint.activate([
            myTextLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            toggleSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            myTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            toggleSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func toggledSwitch(sender: UISwitch) {
        print("Switch toggled")
//        print(ViewController.appCount)
        
        // Save the switch state to UserDefaults
        let safeKey = labelText
        UserDefaults.standard.set(sender.isOn, forKey: safeKey)
        
        
        
        if toggleSwitch.isOn {
            ViewController.appCount += 1
            for app in appListStore.applist {
                if app.korName == safeKey {
                    ViewController.imageString.append(app.engName)
                    print(ViewController.imageString)
                }
            }
        } else {
            if ViewController.appCount <= 0 {
                
            } else {
                ViewController.appCount -= 1
                print(safeKey)
                
                for app in appListStore.applist {
                    
                    if app.korName == safeKey {
                        let tempNum: Int = ViewController.imageString.firstIndex(of: app.engName) ?? 0
                        ViewController.imageString.remove(at: tempNum)
                    }
                    
                }
                
            }
        }
    }
}
