//
//  Day9.swift
//  swift-2020
//
//  Created by Devon DaPuzzo on 2/15/21.
//

import Foundation

class Day9: Day {
    let number: Int = 9
    let xmasCode: XMASReader

    lazy var firstBadValue: Int = {
        xmasCode.findFirstBadValue()!
    }()

    init(xmasCode: [Int]) {
        self.xmasCode = XMASReader(preambleSize: 25, code: xmasCode)
    }

    func problem1() -> Int {
        firstBadValue
    }

    func problem2() -> Int {
        let range = xmasCode.findRange(summingTo: firstBadValue)
        return range.min()! + range.max()!
    }
}