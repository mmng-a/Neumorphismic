//
//  Tab.swift
//  Demo
//
//  Created by Masashi Aso on 2020/01/14.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import SwiftUI

enum Tab: String, Hashable, CaseIterable {
    
    case demo = "Demo"
    case settings = "Settings"
    
    func image() -> Image {
        switch self {
        case .demo:     return Image(systemName: "house")
        case .settings: return Image(systemName: "gear")
        }
    }
    
    func view() -> some View {
        VStack {
            if self == .demo {
                DemosView()
            } else {
                SettingsView()
            }
        }
    }
}

