//
//  SettingsView.swift
//  Demo
//
//  Created by Masashi Aso on 2020/01/14.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import SwiftUI
import Neumorphismic

struct SettingsView: View {
    
    @Environment(\.nmBaseColor) var baseColor: Color
    
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
            baseColor.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack(alignment: .firstTextBaseline) {
                    Text("Base Color Code: ")
                        .foregroundColor(baseColor.primary(0.4))
                    
                    TextField("C1D2EB", text: $model.userInput)
                        .textFieldStyle(PlainTextFieldStyle())
                        .foregroundColor(
                            baseColor.getHSLA().l > 0.5 ? .black : .white
                        )
                        .padding(5)
                        .background(
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .fill(baseColor)
                                .modifier(NMConvexModifier(radius: 9))
                        )
                }
                .padding(15)
                .frame(height: 100)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(baseColor)
                        .modifier(NMConvexModifier())
                )
                
                Spacer().frame(height: 50)
                
                NMHighlightableButton(action: {
                    self.model.showsTabLabelText.toggle()
                }) { isH in
                    Text(self.model.showsTabLabelText ? "Don't Show Tab Text" : "Show Tab Text")
                        .foregroundColor(self.model.showsTabLabelText ? self.baseColor : self.baseColor.primary(0.5))
                        .padding()
                        .frame(width: 220, height: 55)
                        .background(
                            RoundedRectangle(cornerRadius: 27.5)
                                .fill(self.model.showsTabLabelText ? self.baseColor.primary(0.5) : self.baseColor)
                                .modifier(NMConvexModifier())
                        )
                        .opacity(isH ? 0.6 : 1)
                }
                .frame(height: 60)

            }
            .padding(15)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(Model())
    }
}
