import XCTest
@testable import swift_2019

final class day1Tests: XCTestCase {

    func testExample() {
        let subject = Day1([12])
        let solution = subject.solve1()
        XCTAssertEqual(solution, 2)
    }


    func testExample2() {
        let subject = Day1([14])
        let solution = subject.solve1()
        XCTAssertEqual(solution, 2)
    }


    func testExample3() {
        let subject = Day1([1969])
        let solution = subject.solve1()
        XCTAssertEqual(solution, 654)
    }

    func testExample4() {
        let subject = Day1([100756])
        let solution = subject.solve1()
        XCTAssertEqual(solution, 33583)
    }

    func testAddingThemAll(){
        let subject = Day1([1969, 100756, 14, 12])
        let solution = subject.solve1()
        XCTAssertEqual(solution, 33583 + 654 + 2 + 2)
    }
}
