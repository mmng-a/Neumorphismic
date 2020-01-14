//
//  ContentView.swift
//  Demo_tvOS
//
//  Created by Masashi Aso on 2020/01/15.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import SwiftUI
import Neumorphismic

struct ContentView: View {
    
    let baseColor = Color(hex: "C1D2EB")
    
    var body: some View {
        ZStack {
            baseColor
            
            Rectangle()
                .fill(baseColor)
                .frame(width: 500, height: 360)
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
