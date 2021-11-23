//
// Created by Devon D'Apuzzo on 12/11/20.
//

import Foundation

import XCTest
@testable import swift_2020

class Day4Tests: XCTestCase {

    func test_shouldParse3Passports(){
        let day4 = Day4(input: """
                  byr:1971
                  iyr:2017 hgt:160cm
                  eyr:2020 ecl:hzl
                  pid:157096267

                  hgt:183cm
                  pid:368895060
                  ecl:oth eyr:2020
                  iyr:2013
                  byr:1966

                  ecl:lzr cid:279 pid:192cm
                  hcl:1f7352 iyr:2014 hgt:70cm eyr:1983
                  byr:2004
                  """)

        XCTAssertEqual(day4.passports.count, 3)
    }

    func test_shouldBeCorrectForDay4(){
        let day4 = Day4(input: Inputs.day4)
        XCTAssertEqual(day4.problem1(), 182)
    }
}
