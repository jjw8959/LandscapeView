//
//  AppListModel.swift
//  LandscapeView
//
//  Created by woong on 2/4/24.
//

import Foundation

struct AppListModel: Identifiable {
    var id: UUID = UUID()
    let korName: String
    let engName: String
    let url: String
}
