//
//  Color++.swift
//  Demo
//
//  Created by Masashi Aso on 2019/01/01.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI

extension Color {
    func primary(_ value: Double) -> Color {
        let (_, _, l, _) = getHSLA()
        return (l > 0.5) ? darker(value) : lighter(value)
    }
}
