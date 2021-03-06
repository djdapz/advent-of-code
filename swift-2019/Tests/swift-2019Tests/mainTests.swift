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
        let day2 = Day2(
                program: Inputs.day2,
                desiredValue: 19690720
        )
        let day3 = Day3(
                wire1: Wire(specs: Inputs.day3[0]),
                wire2: Wire(specs: Inputs.day3[1])
        )

        XCTAssertEqual(day1.solve1(), 3282386)
        XCTAssertEqual(day1.solve2(), 4920708)
        XCTAssertEqual(day2.solve1(), 4462686)
        XCTAssertEqual(day2.solve2(), 5936)
        XCTAssertEqual(day3.solve1(), 865)
        XCTAssertEqual(day3.solve2(), 35038)
    }
}
