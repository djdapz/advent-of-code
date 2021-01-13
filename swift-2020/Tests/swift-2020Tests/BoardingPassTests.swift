//
// Created by Devon D'Apuzzo on 12/12/20.
//

import Foundation

import XCTest
@testable import swift_2020

class BoardingPassTests: XCTestCase {

    func test_shouldDetermineMyRow() {
        XCTAssertEqual(BoardingPass(from: "BFFFBBFRRR").row, 70)
        XCTAssertEqual(BoardingPass(from: "FFFBBBFRRR").row, 14)
        XCTAssertEqual(BoardingPass(from: "BBFFBBFRLL").row, 102)
    }

    func test_shouldDetermineMyCol() {
        XCTAssertEqual(BoardingPass(from: "BFFFBBFRRR").col, 7)
        XCTAssertEqual(BoardingPass(from: "FFFBBBFRRR").col, 7)
        XCTAssertEqual(BoardingPass(from: "BBFFBBFRLL").col, 4)
    }


    func test_shouldDetermineMyID() {
        XCTAssertEqual(BoardingPass(from: "BFFFBBFRRR").id, 567)
        XCTAssertEqual(BoardingPass(from: "FFFBBBFRRR").id, 119)
        XCTAssertEqual(BoardingPass(from: "BBFFBBFRLL").id, 820)
    }
}
