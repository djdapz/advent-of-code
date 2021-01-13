//
// Created by Devon D'Apuzzo on 12/15/20.
//

import Foundation

import XCTest
@testable import swift_2020

class CustomsFormTest: XCTestCase {

    func test_shouldTellMeWhenOneePersonHasAFewItems(){
        XCTAssertEqual(CustomsForm(from: "abc").count, 3)
    }

    func test_shouldTellMeWhenTwoPeopleHaveUniqueItems(){
        XCTAssertEqual(CustomsForm(from: "abc\ndef").count, 6)
    }

    func test_shouldTellMeWhenTwoPeopleHaveSomeOverlap(){
        XCTAssertEqual(CustomsForm(from: "abc\nabf").count, 4)
    }


}
