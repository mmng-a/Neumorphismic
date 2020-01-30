//
//  DemosView.swift
//  Demo
//
//  Created by Masashi Aso on 2020/01/14.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import SwiftUI
import Neumorphismic

struct DemosView: View {
    
    @Environment(\.nmBaseColor) var baseColor: Color
    
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
            baseColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Rectangle()
                    .fill(baseColor)
                    .frame(width: 300, height: 200)
                    .modifier(NMConvexModifier())
                
                Spacer().frame(height: 60)
                
                NMHighlightableButton(action: {
                    self.model.isFavorite.toggle()
                }) { isH in
                    Image(systemName: self.model.isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:  20, height: 20)
                        .foregroundColor(self.baseColor.primary(0.4))
                        .background(
                            Circle()
                                .fill(self.baseColor)
                                .frame(width:  60, height: 60)
                                .modifier(NMConvexModifier())
                        )
                        .opacity(isH ? 0.6 : 1)
                }
                .frame(width: 60, height: 60)
            }
        }
    }
}

struct DemosView_Previews: PreviewProvider {
    static var previews: some View {
        DemosView()
            .environment(\.nmBaseColor, Color(hex: "C1D2EB"))
            .environmentObject(Model())
    }
}
