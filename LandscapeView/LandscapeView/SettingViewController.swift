//
//  SettingViewController.swift
//  LandscapeView
//
//  Created by woong on 2/3/24.
//

import UIKit

class SettingViewController: UIViewController {

    var tableView: UITableView = UITableView()
    
    let appList: [String] = ["카카오맵", "네이버지도", "티맵", "카카오톡", "메시지", "전화"]
    
    let appListStore: AppListStore = AppListStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func buildUI() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        tableView = {
            let tableView = UITableView()
            tableView.backgroundColor = .systemCyan
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.delegate = self
            tableView.dataSource = self
 
            return tableView
        }()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        
        self.view.addSubview(tableView)
        
        navigationController?.navigationBar.isHidden = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
        ])
    }

}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return appList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
//        cell.labelText = appList[indexPath.row]
        cell.labelText = appListStore.applist[indexPath.row].korName
        cell.selectionStyle = .none
        return cell
    }
    
    
}
