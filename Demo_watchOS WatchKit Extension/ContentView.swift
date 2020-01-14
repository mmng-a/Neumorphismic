//
//  ContentView.swift
//  Demo_watchOS WatchKit Extension
//
//  Created by Masashi Aso on 2020/01/15.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import SwiftUI
import Neumorphismic

struct ContentView: View {
    
    let baseColor = Color(hex: "202020")
    
    var body: some View {
        ZStack {
            baseColor
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .fill(baseColor)
                .padding(20)
                .modifier(NMConvexModifier())
                .environment(\.nmBaseColor, baseColor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
