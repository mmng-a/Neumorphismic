//
//  NMHighlightableButton.swift
//  Neumorphismic
//
//  Created by Masashi Aso on 2020/01/14.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI

#if os(tvOS)
#else
@available(iOS 13, OSX 10.15, watchOS 6, *)
public struct NMHighlightableButton<Label>: View where Label: View {
    
    private let action: () -> Void
    private let label: (Bool) -> Label
    
    public init(
        action: @escaping () -> Void,
        label: @escaping (Bool) -> Label
    ) {
        self.action = action
        self.label = label
    }
    
    @State private var isHighlighted = false
    
    public var body: some View {
        label(isHighlighted)
            .animation(.easeOut(duration: 0.05))
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    withAnimation { self.isHighlighted = true }
                }
                .onEnded { _ in
                    self.action()
                    withAnimation { self.isHighlighted = false }
                }
        )
    }
}

#if os(OSX)
#else

@available(iOS 13, watchOS 6, *)
internal struct HighlightableButton_ForPreviews: View {
    @State var isSelected = false
    var body: some View {
        NMHighlightableButton(action: {
            self.isSelected.toggle()
        }) { isH in
            Image(systemName: self.isSelected ? "house.fill" : "house")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .opacity(isH ? 0.6 : 1)
                .frame(width: isH ? 80 : 100,
                       height: isH ? 80 : 100)
        }
    }
}


@available(iOS 13, watchOS 6, tvOS 13, *)
internal struct ConvexModifier_Button_ForPreviews: View {
    @State var isSelected = false
    var body: some View {
        Button(action: {
            self.isSelected.toggle()
        }) {
            Image(systemName: self.isSelected ? "house.fill" : "house")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
                .foregroundColor(Color(hex: "C1D2EB").darker(0.18))
                .background(
                    Circle()
                        .fill(Color(hex: "C1D2EB"))
                        .frame(width: 100, height: 100)
                        .modifier(NMConvexModifier())
                )
        }
    }
}


@available(iOS 13, watchOS 6, *)
internal struct ConvexModifier_HighlightableButton_ForPreviews: View {
    @State var isSelected = false
    var body: some View {
        NMHighlightableButton(action: {
            self.isSelected.toggle()
        }) { isH in
            Image(systemName: self.isSelected ? "house.fill" : "house")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: isH ? 54 : 60)
                .foregroundColor(Color(hex: "C1D2EB").darker(0.18))
                .background(
                    Circle()
                        .fill(Color(hex: "C1D2EB"))
                        .frame(width: isH ? 90 : 100,
                               height: isH ? 90 : 100)
                        .modifier(NMConvexModifier())
                )
                .opacity(isH ? 0.6 : 1)
        }
    }
}


@available(iOS 13, watchOS 6, *)
internal struct HighlightableButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HighlightableButton_ForPreviews()
                .previewDisplayName("HighlightableButton")
            
            ZStack {
                Color(hex: "C1D2EB")
                ConvexModifier_Button_ForPreviews()
            }
            .previewDisplayName("Button & ConvexModifier")
            
            ZStack {
                Color(hex: "C1D2EB")
                ConvexModifier_HighlightableButton_ForPreviews()
            }
            .previewDisplayName("HighlightableButton & ConvexModifier")
        }
        .environment(\.nmBaseColor, Color(hex: "C1D2EB"))
        .previewLayout(.fixed(width: 150, height: 150))
    }
}

#endif
#endif
#endif
