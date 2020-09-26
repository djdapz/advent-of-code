import XCTest
@testable import swift_2019

final class intcodeTests: XCTestCase {

    func test_resultPlacedInBeginning() {
        XCTAssertEqual([1, 0, 0, 0, 99].runAsIntcode(), [2, 0, 0, 0, 99])
    }

    func test_resultPlacedInMIddle() {
        XCTAssertEqual([1, 0, 0, 1, 99].runAsIntcode(), [1, 2, 0, 1, 99])
        XCTAssertEqual([1, 0, 0, 2, 99].runAsIntcode(), [1, 0, 2, 2, 99])
        XCTAssertEqual([1, 0, 0, 3, 99].runAsIntcode(), [1, 0, 0, 2, 99])
    }

    func test_resultPlacedAtEnd() {
        XCTAssertEqual([1, 0, 0, 5, 99, 0].runAsIntcode(), [1, 0, 0, 5, 99, 2])
    }

    func test_addition_adds_one_word() {
        let input = [1, 4, 2, 0, 99]
        let expectedOutput = [101, 4, 2, 0, 99]
        XCTAssertEqual(input.runAsIntcode(), expectedOutput)
    }

    func test_addition_adds_two_words() {
        let input = [1, 8, 2, 0, 1, 5, 2, 1, 99]
        let expectedOutput = [101, 7, 2, 0, 1, 5, 2, 1, 99]
        XCTAssertEqual(input.runAsIntcode(), expectedOutput)
    }

    func test_multiplication_multiplies_one_word() {
        let input = [2, 4, 2, 0, 99]
        let expectedOutput = [198, 4, 2, 0, 99]
        XCTAssertEqual(input.runAsIntcode(), expectedOutput)
    }

    func testExamples() {
        XCTAssertEqual([1, 0, 0, 0, 99].runAsIntcode(), [2, 0, 0, 0, 99])
        XCTAssertEqual([2, 3, 0, 3, 99].runAsIntcode(), [2, 3, 0, 6, 99])
        XCTAssertEqual([2, 4, 4, 5, 99, 0].runAsIntcode(), [2, 4, 4, 5, 99, 9801])
        XCTAssertEqual([1, 1, 1, 4, 99, 5, 6, 0, 99].runAsIntcode(), [30, 1, 1, 4, 2, 5, 6, 0, 99])
    }
}

