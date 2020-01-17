#if os(watchOS)
#else
import XCTest
@testable import Neumorphismic

final class NeumorphismicTests: XCTestCase {
    func testExample() {
        
    }

    static var allTests = [
        ("test_colorTransformer", test_colorTransformer),
    ]
    
    func test_colorTransformer() {
        let r = 0.5, g = 0.6, b = 0.9
        let hsl = ColorTransformer.rgbToHsl(r: r, g: g, b: b)
        let rgb = ColorTransformer.hslToRgb(h: hsl.h, s: hsl.s, l: hsl.l)
        XCTAssertEqual(rgb.r, r, accuracy: 0.05)
        XCTAssertEqual(rgb.g, g, accuracy: 0.05)
        XCTAssertEqual(rgb.b, b, accuracy: 0.05)
    }
}
#endif
