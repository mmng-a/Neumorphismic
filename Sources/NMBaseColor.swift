//
//  NMBaseColor.swift
//  Neumorphismic
//
//  Created by Masashi Aso on 2020/01/14.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13, OSX 10.15, watchOS 6, tvOS 13, *)
public struct NMBaseColorKey: EnvironmentKey {
    public static let defaultValue: Color = Color(hex: "C1D2EB")
}

@available(iOS 13, OSX 10.15, watchOS 6, tvOS 13, *)
public extension EnvironmentValues {
    var nmBaseColor: Color {
        get { self[NMBaseColorKey.self] }
        set { self[NMBaseColorKey.self] = newValue }
    }
}

#endif
