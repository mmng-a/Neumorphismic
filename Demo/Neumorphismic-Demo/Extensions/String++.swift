//
//  String++.swift
//  Demo
//
//  Created by Masashi Aso on 2020/01/14.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import Foundation

extension String {
    var isHEXable: Bool {
        self.pregMatche(pattern: "[0-9a-fA-F]") && self.count == 6
    }
}

extension String {
    //絵文字など(2文字分)も含めた文字数を返します
    var length: Int {
        let string_NS = self as NSString
        return string_NS.length
    }

    //正規表現の検索をします
    func pregMatche(pattern: String, options: NSRegularExpression.Options = []) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else {
            return false
        }
        let matches = regex.matches(in: self, options: [], range: NSMakeRange(0, self.length))
        return matches.count > 0
    }

    //正規表現の検索結果を利用できます
    func pregMatche(pattern: String, options: NSRegularExpression.Options = [], matches: inout [String]) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else {
            return false
        }
        let targetStringRange = NSRange(location: 0, length: self.length)
        let results = regex.matches(in: self, options: [], range: targetStringRange)
        for i in 0 ..< results.count {
            for j in 0 ..< results[i].numberOfRanges {
                let range = results[i].range(at: j)
                matches.append((self as NSString).substring(with: range))
            }
        }
        return results.count > 0
    }

    //正規表現の置換をします
    func pregReplace(pattern: String, with: String, options: NSRegularExpression.Options = []) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        return regex.stringByReplacingMatches(in: self, options: [], range: NSMakeRange(0, self.length), withTemplate: with)
    }
}


