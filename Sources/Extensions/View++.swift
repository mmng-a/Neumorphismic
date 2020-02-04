//
//  View++.swift
//  Neumorphismic
//
//  Created by Masashi Aso on 2020/02/04.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import SwiftUI

extension View {
    
    
    /// View  conform to Neumorphism
    /// If you want to set preference, you can use `.modifier(NMConvexModifier(...)`
    func nmConvexed() -> some View {
        self.modifier(NMConvexModifier())
    }
    
}
