//
//  File.swift
//  
//
//  Created by Devon D'Apuzzo on 9/21/20.
//

import XCTest
@testable import swift_2019

final class mainTests: XCTestCase {

    func testAdventWorks() {
        let day1 = Day1(Inputs.day1)
        let day2 = Day2(Inputs.day2)

        XCTAssertEqual(day1.solve1(), 3282386)
        XCTAssertEqual(day1.solve2(), 4920708)
        XCTAssertEqual(day2.solve1(), 4462686)
    }
}
