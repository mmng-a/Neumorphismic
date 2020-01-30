//
//  ContentView.swift
//  Demo
//
//  Created by Masashi Aso on 2020/01/14.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import SwiftUI
import Neumorphismic

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @EnvironmentObject var model: Model
    @State var selection: Tab = .demo
    
    var body: some View {
        NMFloatingTabView(
            selection: $selection,
            horizontalPadding: UIDevice.current.hasRoundedDisplay ? 0 : 34,
            labelText: { tab in
                self.model.showsTabLabelText ? tab.rawValue : nil
            },
            labelImage: { tab in
                tab.image()
            }
        ) { tab in
            tab.view()
        }
        .environment(\.nmBaseColor, Color(hex: model.baseColorHEX))
        .environment(\.colorScheme, Color(hex: model.baseColorHEX).getHSLA().l > 0.5
            ? .light : .dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(.init(rawValue: "iPhone X"))
            ContentView()
                .previewDevice(.init(rawValue: "iPhone 8"))
        }
        .environmentObject(Model())
    }
}
