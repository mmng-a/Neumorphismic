//
//  NeumorphismicTests.swift
//  NeumorphismicTests
//
//  Created by Masashi Aso on 2020/01/30.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

#if os(watchOS)
#else
import XCTest
@testable import Neumorphismic

final class ColorTransformerTests: XCTestCase {

    static var allTests = [
        ("test_rgbToHsl_hslToRgb", test_rgbToHsl_hslToRgb),
        ("test_rgbToHsb_hsbToRgb", test_rgbToHsb_hsbToRgb),
    ]
    
    func test_rgbToHsl_hslToRgb() {
        for _ in 0...100 {
            let r = Double.random(in: 0...1)
            let g = Double.random(in: 0...1)
            let b = Double.random(in: 0...1)
            let hsl = ColorTransformer.rgbToHsl(r: r, g: g, b: b)
            let rgb = ColorTransformer.hslToRgb(h: hsl.h, s: hsl.s, l: hsl.l)
            XCTAssertEqual(rgb.r, r, accuracy: 0.01)
            XCTAssertEqual(rgb.g, g, accuracy: 0.01)
            XCTAssertEqual(rgb.b, b, accuracy: 0.01)
        }
    }
    
    func test_rgbToHsb_hsbToRgb() {
        for _ in 0...100 {
            let r = Double.random(in: 0...1)
            let g = Double.random(in: 0...1)
            let b = Double.random(in: 0...1)
            let hsb = ColorTransformer.rgbToHsb(r: r, g: g, b: b)
            let rgb = ColorTransformer.hsbToRgb(h: hsb.h, s: hsb.s, b: hsb.b)
            XCTAssertEqual(rgb.r, r, accuracy: 0.01)
            XCTAssertEqual(rgb.g, g, accuracy: 0.01)
            XCTAssertEqual(rgb.b, b, accuracy: 0.01)
        }
    }
}
#endif
