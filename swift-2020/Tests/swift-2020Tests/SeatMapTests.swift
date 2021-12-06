//
// Created by Devon D'Apuzzo on 11/22/21.
//

import Foundation

import XCTest
@testable import swift_2020

final class SeatMapTests: XCTestCase {

    func test_first_iteration() {
        let subject = SeatMap(layout: """
                                      L.LL.LL.LL
                                      LLLLLLL.LL
                                      L.L.L..L..
                                      LLLL.LL.LL
                                      L.LL.LL.LL
                                      L.LLLLL.LL
                                      ..L.L.....
                                      LLLLLLLLLL
                                      L.LLLLLL.L
                                      L.LLLLL.LL
                                      """)

        let firstIteraton = subject.iterate()

        let expected = """
                       #.##.##.##
                       #######.##
                       #.#.#..#..
                       ####.##.##
                       #.##.##.##
                       #.#####.##
                       ..#.#.....
                       ##########
                       #.######.#
                       #.#####.##
                       """

        XCTAssertEqual(firstIteraton.toString(), expected)
    }

    func test_iteratingAndRemovingOccupiedPeople() {
        let subject = SeatMap(layout: """
                                      #.##.##.##
                                      #######.##
                                      #.#.#..#..
                                      ####.##.##
                                      #.##.##.##
                                      #.#####.##
                                      ..#.#.....
                                      ##########
                                      #.######.#
                                      #.#####.##
                                      """)


        let expected = """
                       #.LL.L#.##
                       #LLLLLL.L#
                       L.L.L..L..
                       #LLL.LL.L#
                       #.LL.LL.LL
                       #.LLLL#.##
                       ..L.L.....
                       #LLLLLLLL#
                       #.LLLLLL.L
                       #.#LLLL.##
                       """

        let firstIteraton = subject.iterate()
        XCTAssertEqual(firstIteraton.toString(), expected)
    }

    func test_should_iterate_until_stability() {
        let subject = SeatMap(layout: """
                                      L.LL.LL.LL
                                      LLLLLLL.LL
                                      L.L.L..L..
                                      LLLL.LL.LL
                                      L.LL.LL.LL
                                      L.LLLLL.LL
                                      ..L.L.....
                                      LLLLLLLLLL
                                      L.LLLLLL.L
                                      L.LLLLL.LL
                                      """)

        let steady = subject.findSteadyState()

        let expected = """
                       #.#L.L#.##
                       #LLL#LL.L#
                       L.#.L..#..
                       #L##.##.L#
                       #.#L.LL.LL
                       #.#L#L#.##
                       ..L.L.....
                       #L#L##L#L#
                       #.LLLLLL.L
                       #.#L#L#.##
                       """

        XCTAssertEqual(steady.toString(), expected)
    }

    func test_readingSafely() {
        let subject = SeatMap(layout: """
                                      #.#L.L#.##
                                      #LLL#LL.L#
                                      L.#.L..#..
                                      #L##.##.L#
                                      #.#L.LL.LL
                                      #.#L#L#.##
                                      ..L.L.....
                                      #L#L##L#L#
                                      #.LLLLLL.L
                                      #.#L#L#.##     
                                      """)

        XCTAssertEqual(.occupied, subject.safeRead(rowNum: 0, colNum: 0))
        XCTAssertEqual(.occupied, subject.safeRead(rowNum: 1, colNum: 0))
        XCTAssertEqual(.floor, subject.safeRead(rowNum: 0, colNum: 1))
        XCTAssertEqual(.empty, subject.safeRead(rowNum: 1, colNum: 1))
        XCTAssertEqual(nil, subject.safeRead(rowNum: -1, colNum: 1))
        XCTAssertEqual(nil, subject.safeRead(rowNum: 100, colNum: 1))
    }

}