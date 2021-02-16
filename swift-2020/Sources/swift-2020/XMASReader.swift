//
//  XMASReader.swift
//  swift-2020
//
//  Created by Devon DaPuzzo on 2/15/21.
//

import Foundation

class XMASReader {

    private let preambleSize: Int
    private let code: [Int]

    public init(preambleSize: Int, code: [Int]) {
        self.preambleSize = preambleSize
        self.code = code
    }

    public func isValid(atIndex: Int) -> Bool {
        let preambleStart = atIndex - preambleSize
        let preambleEnd = atIndex - 1
        let expectedSum = code[atIndex]

        for i in preambleStart...(preambleEnd - 1) {
            for j in (i + 1)...preambleEnd {
                if code[i] + code[j] == expectedSum {
                    return true
                }
            }
        }
        return false
    }

    public func findFirstBadValue() -> Int? {
        for i in preambleSize...code.count - 1 {
            if !isValid(atIndex: i) {
                return code[i]
            }
        }
        return nil
    }


    public func findRange(summingTo target: Int) -> ArraySlice<Int> {
        let end = code.count - 1
        for leading in 0...end {
            var sum = code[leading]
            for trailing in leading + 1...end {
                sum = sum + code[trailing]

                if sum > target {
                    break
                }

                if (sum == target) {
                    return code[leading...trailing]
                }
            }
        }

        return ArraySlice<Int>()
    }
}
