//
//  ViewController.swift
//  LandscapeView
//
//  Created by woong on 1/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    static var appCount: Int = 0
    static var imageString: [String] = []
    static var urlString: [String] = []
    
    var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    var settingButton: UIButton = UIButton()
    
    var screenWidth = 0.0
    var screenHeight = 0.0
    
    var leftView: UIView = UIView()
    
    var etaLabel: BaseLabel = BaseLabel()
    
    var leftLabel: BaseLabel = BaseLabel()
    var rightLabel: BaseLabel = BaseLabel()
    
//    var leftImage: BaseImageView = BaseImageView()
//    var rightImage: BaseImageView = BaseImageView()
    var leftImage: UIImageView = UIImageView()
    var rightImage: UIImageView = UIImageView()
    
    let mapNet: MapNetwork = MapNetwork()
    let weatherNet: WeatherNetwork = WeatherNetwork()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController viewDidLoad : \(ViewController.appCount)")
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        screenWidth = safeArea.layoutFrame.width
        screenHeight = safeArea.layoutFrame.height
        
        etaLabel.labelText = mapNet.arrivalTime
        etaLabel.backgroundColor = .red
        leftLabel.labelText = weatherNet.homeWeather
        leftLabel.backgroundColor = .cyan
        rightLabel.labelText = weatherNet.arrivalWeather
        rightLabel.backgroundColor = .darkGray
        
        settingButton = {
            let button = UIButton()
            let image = UIImageView()
            image.image = UIImage(systemName: "gearshape")
            image.translatesAutoresizingMaskIntoConstraints = false
            button.addSubview(image)
            NSLayoutConstraint.activate([
                image.topAnchor.constraint(equalTo: button.topAnchor),
                image.bottomAnchor.constraint(equalTo: button.bottomAnchor),
                image.leadingAnchor.constraint(equalTo: button.leadingAnchor),
                image.trailingAnchor.constraint(equalTo: button.trailingAnchor),
            ])
            button.backgroundColor = .white
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        leftView = {
            let view = UIView()
            view.backgroundColor = .systemPink
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        leftImage = {
            let image = UIImageView()
            //            image.image = weatherNet.homeWeatherImage
            image.image = UIImage(systemName: "sun.max")
            image.backgroundColor = .white
            image.contentMode = .scaleAspectFit
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        
        rightImage = {
            let image = UIImageView()
            //            image.image = weatherNet.arrivalWeatherImage
            image.image = UIImage(systemName: "sun.max")
            image.backgroundColor = .systemGreen
            image.contentMode = .scaleAspectFit
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        
        collectionView = {
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.minimumLineSpacing = CGFloat(50)
            collectionViewLayout.minimumInteritemSpacing = CGFloat(10)
            collectionViewLayout.itemSize = CGSize(width: screenHeight / 4, height: screenHeight / 4)
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
            collectionView.backgroundColor = .brown
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            return collectionView
        }()
        
        view.backgroundColor = .black
        
        view.addSubview(leftView)
        
        leftView.addSubview(etaLabel)
        leftView.addSubview(leftLabel)
        leftView.addSubview(rightLabel)
        leftView.addSubview(leftImage)
        leftView.addSubview(rightImage)
        
        view.addSubview(settingButton)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            settingButton.topAnchor.constraint(equalTo: safeArea.topAnchor),
            settingButton.heightAnchor.constraint(equalToConstant: screenHeight / 8),
            settingButton.widthAnchor.constraint(equalToConstant: screenHeight / 8),
            settingButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: settingButton.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: screenWidth / 3),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            leftView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            leftView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            leftView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            leftView.trailingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            
            etaLabel.topAnchor.constraint(equalTo: leftView.topAnchor),
            etaLabel.heightAnchor.constraint(equalTo: leftView.heightAnchor, multiplier: 1/3),
            etaLabel.leadingAnchor.constraint(equalTo: leftView.leadingAnchor),
            etaLabel.trailingAnchor.constraint(equalTo: leftView.trailingAnchor),
            
            leftLabel.topAnchor.constraint(equalTo: etaLabel.bottomAnchor),
            leftLabel.leadingAnchor.constraint(equalTo: leftView.leadingAnchor),
            leftLabel.widthAnchor.constraint(equalTo: leftView.widthAnchor, multiplier: 0.5),
            leftLabel.heightAnchor.constraint(equalTo: leftView.heightAnchor, multiplier: 0.1),
            
            rightLabel.topAnchor.constraint(equalTo: etaLabel.bottomAnchor),
            rightLabel.widthAnchor.constraint(equalTo: leftLabel.widthAnchor),
            rightLabel.trailingAnchor.constraint(equalTo: leftView.trailingAnchor),
            rightLabel.heightAnchor.constraint(equalTo: leftView.heightAnchor, multiplier: 0.1),
            
            leftImage.topAnchor.constraint(equalTo: leftLabel.bottomAnchor),
            leftImage.widthAnchor.constraint(equalTo: leftView.widthAnchor, multiplier: 0.5),
            leftImage.bottomAnchor.constraint(equalTo: leftView.bottomAnchor),
            leftImage.leadingAnchor.constraint(equalTo: leftView.leadingAnchor),
            
            rightImage.topAnchor.constraint(equalTo: leftLabel.bottomAnchor),
            rightImage.widthAnchor.constraint(equalTo: leftView.widthAnchor, multiplier: 0.5),
            rightImage.bottomAnchor.constraint(equalTo: leftView.bottomAnchor),
            rightImage.trailingAnchor.constraint(equalTo: leftView.trailingAnchor),
        ])
        settingButton.addTarget(self, action: #selector(goToSetting), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        self.view.isHidden = false
        
        print(ViewController.imageString)
        collectionView.reloadData()
    }
    
    @objc func goToSetting() {
        let vc = SettingViewController()
//        present(vc, animated: true)
        self.view.isHidden = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ViewController.appCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
//        cell.buttonImageAsset = "tmap"
        cell.buttonImage.image = UIImage(named: ViewController.imageString[indexPath.row])
        
        print(ViewController.imageString[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let itemIndex = indexPath.row
        
        // item 인덱스 존재여부 확인 -> 있으면 해당 아이템 뭔지 전역 배열에서 확인하고 가져오기
        //        if itemIndex == 0 {
//        for app in 0...1 {}
//        showNmap(url: "aaa")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if (collectionView.dataSource?.collectionView(collectionView, numberOfItemsInSection: 0))! < 7 {
            
        }
        return UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
    }
    
    func showNmap(url: String) {
        
        guard let url = URL(string: "nmap://actionPath?parameter=value&appname=com.jjw8959.LandscapeView") else { return }
        let appStoreURL = URL(string: "http://itunes.apple.com/app/id311867728?mt=8")!//앱스토어 연결 url
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.open(appStoreURL)
        }
        
    }
}



