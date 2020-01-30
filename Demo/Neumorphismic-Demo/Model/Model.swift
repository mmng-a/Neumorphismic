//
//  Model.swift
//  Demo
//
//  Created by Masashi Aso on 2020/01/14.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import Combine

class Model: ObservableObject {
    
    @Published var userInput = "C1D2EB" {
        didSet {
            if self.userInput.isHEXable {
                self.baseColorHEX = self.userInput
            }
        }
    }
    
    var baseColorHEX = "C1D2EB"
    
    @Published var isFavorite = false
    
    @Published var showsTabLabelText = true
    
}
