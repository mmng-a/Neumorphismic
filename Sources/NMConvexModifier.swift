//
//  NMConvexModifier.swift
//  Neumorphismic
//
//  Created by Masashi Aso on 2020/01/14.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13, OSX 10.15, watchOS 6, tvOS 13, *)
public struct NMConvexModifier: ViewModifier {
    
    @Environment(\.nmBaseColor) private var baseColor: Color
    
    private let darkShadowColor: Color?
    private let lightShadowColor: Color?
    
    private let radius: CGFloat
    private let x: CGFloat
    private let y: CGFloat
    
    /// View  conform to Neumorphism
    /// You can use this by `.modifier(NMConvexModifier())` or `.nmConvexed()`
    /// - Parameters:
    ///   - bottomRightShadowColor: default is 18% darker color from `nmBaseColor`
    ///   - topLeftShadowColor: default is 12% lighter color from `nmBaseColor`
    ///   - radius: shadow's radius. default is `16`
    ///   - x: horizontal distance between View to shadow. default is `9`
    ///   - y: vertical distance between View to shadow. default is `9`
    public init(
        bottomRightShadowColor: Color? = nil, topLeftShadowColor: Color? = nil,
        radius: CGFloat = 16, x: CGFloat = 9, y: CGFloat = 9
    ) {
        self.darkShadowColor = bottomRightShadowColor
        self.lightShadowColor = topLeftShadowColor

        self.radius = radius
        self.x = x
        self.y = y
    }
    
    public func body(content: Content) -> some View {
        content
            .shadow(color: darkShadowColor ?? baseColor.darker(0.18),
                    radius: radius, x: x, y: y)
            .shadow(color: lightShadowColor ?? baseColor.lighter(0.12),
                    radius: radius, x: -x, y: -y)
    }
}

@available(iOS 13, OSX 10.15, watchOS 6, tvOS 13, *)
internal struct ConvexModifier_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(hex: "C1D2EB")
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .fill(Color(hex: "C1D2EB"))
                .modifier(NMConvexModifier())
                .frame(width: 300, height: 300)
        }
        .environment(\.nmBaseColor, Color(hex: "C1D2EB"))
    }
}

#endif
