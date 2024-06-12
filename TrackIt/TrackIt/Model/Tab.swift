//
//  Tab.swift
//  TrackIt
//
//  Created by Ayush Agarwal on 10/06/24.
//

import SwiftUI

enum Tab: String{
    case recents = "Recents"
    case search = "Search"
    case settings = "Settings"
    @ViewBuilder
    var tabContent : some View{
        switch self{
        case .recents :
            Image(systemName: "calendar")
            Text(self.rawValue)
        case .search:
            Image(systemName: "magnifyingglass")
            Text(self.rawValue)
        case .settings:
            Image(systemName: "gearshape")
            Text(self.rawValue)
        }
    }
}
