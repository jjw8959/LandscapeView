//
//  AppListStore.swift
//  LandscapeView
//
//  Created by woong on 2/4/24.
//

import Foundation

struct AppListStore {
    var applist: [AppListModel]
    
    init() {
        applist = [
            AppListModel(korName: "카카오맵", engName: "kakaomap", url:""),// url은 Url Scheme에 맞춰 수정
            AppListModel(korName: "네이버 지도", engName: "nmap", url:""),
            AppListModel(korName: "티맵", engName: "tmap", url:""),
            AppListModel(korName: "카카오톡", engName: "kakaotalk", url:""),
            AppListModel(korName: "메시지", engName: "message", url:""),
            AppListModel(korName: "전화", engName: "call", url:""),
        ]
    }
}
