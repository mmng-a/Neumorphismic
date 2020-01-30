//
//  ContentView.swift
//  Demo_macOS
//
//  Created by Masashi Aso on 2020/01/15.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import SwiftUI
import Neumorphismic

struct ContentView: View {
    
    let baseColor = Color(hex: "005080")
    
    var body: some View {
        ZStack {
            baseColor
            
            RoundedRectangle(cornerRadius: 20)
                .fill(baseColor)
                .frame(width: 300, height: 200)
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
