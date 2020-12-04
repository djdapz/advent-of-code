//
// Created by Devon DaPuzzo on 12/2/20.
//


import Foundation

import XCTest
@testable import swift_2020

final class PasswordTests: XCTestCase {

    func testAllowsPasswordWithinBounds(){
        let password = Password("1-3 a: abcda")
        XCTAssertEqual(password.isValid, true)
    }

    func testAllowsPasswordMatchinMinimum(){
        let password = Password("1-3 a: abcd")
        XCTAssertEqual(password.isValid, true)
    }

    func testDisallowsPasswordUnder(){
        let password = Password("1-3 e: abcda")
        XCTAssertEqual(password.isValid, false)
    }

    func testDisallowsPasswordOver(){
        let password = Password("1-3 a: aaabcda")
        XCTAssertEqual(password.isValid, false)
    }

    func testAllowsPasswordOnOverEdge(){
        let password = Password("1-3 a: aaabcd")
        XCTAssertEqual(password.isValid, true)
    }

    func testSecondDisallowsPasswordWhenNoSpecialCharacter(){
        let password = Password("1-3 a: rbcde")
        XCTAssertEqual(password.isValidReal, false)
    }

    func testSecondAllowsPasswordWhenSpecialCharacterInFirstSpot(){
        let password = Password("1-3 a: abcde")
        XCTAssertEqual(password.isValidReal, true)
    }

    func testSecondAllowsPasswordWhenSpecialCharacterInSecondSpot(){
        let password = Password("1-3 a: rbade")
        XCTAssertEqual(password.isValidReal, true)
    }

    func testSecondDisAllowsPasswordWhenSpecialCharacterInBothSpots(){
        let password = Password("1-3 a: abade")
        XCTAssertEqual(password.isValidReal, false)
    }
}