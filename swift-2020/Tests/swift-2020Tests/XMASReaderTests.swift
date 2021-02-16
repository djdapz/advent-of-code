//
//  XMASReaderTests.swift
//  swift-2020Tests
//
//  Created by Devon DaPuzzo on 2/15/21.
//

import Foundation
import XCTest
@testable import swift_2020

class XMASReaderTests: XCTestCase {

    func test_shouldTellMeWhenANumberIsCompliantToPreamble() {
        let subject = XMASReader(preambleSize: 5, code: [10, 20, 5, 30, 40, 30])
        let isValid: Bool = subject.isValid(atIndex: 5)
        XCTAssertTrue(isValid)
    }

    func test_shouldTellMeWhenANumberIsNotToPreamble() {
        let subject = XMASReader(preambleSize: 5, code: [10, 20, 5, 30, 40, 100])
        let isValid: Bool = subject.isValid(atIndex: 5)
        XCTAssertFalse(isValid)
    }

    func test_shouldNotAllowSumOfTheSameNumber() {
        let subject = XMASReader(preambleSize: 5, code: [10, 3, 5, 30, 40, 6])
        let isValid: Bool = subject.isValid(atIndex: 5)
        XCTAssertFalse(isValid)
    }

    func test_shouldAllowForAMovingPreamble() {
        let subject = XMASReader(preambleSize: 5, code: [10, 3, 5, 30, 40, 6, 46])
        XCTAssertFalse(subject.isValid(atIndex: 5))
        XCTAssertTrue(subject.isValid(atIndex: 6))
    }

    func test_shouldFindFirstNonCompliantValue() {
        let subject = XMASReader(preambleSize: 5, code: [10, 3, 5, 30, 40, 8, 46])
        let badValue = subject.findFirstBadValue()
        XCTAssertEqual(46, badValue)
    }

    func test_shouldFindNumbersThatAddToSum() {
        let subject = XMASReader(preambleSize: 5, code: [1, 2, 3, 4, 5, 6, 107, 8, 9, 10])
        let range = subject.findRange(summingTo: 121)
        XCTAssertEqual(range, [6, 107, 8])
    }
}