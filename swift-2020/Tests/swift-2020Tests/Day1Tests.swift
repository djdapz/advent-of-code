//
//  File.swift
//  
//
//  Created by Devon DaPuzzo on 11/30/20.
//

import XCTest
@testable import swift_2020

final class Day1Tests: XCTestCase {
    func testExample() {
        let day = Day1(expenses: [1721,
                                  979,
                                  366,
                                  299,
                                  675,
                                  1456])
        
        XCTAssertEqual(day.problem1(), 514579)
    }
    
    func testMutipliesPairFound() {
        let day = Day1(expenses: [20,
                                  10,
                                  3,
                                  53,
                                  111,
                                  2000])
        
        XCTAssertEqual(day.problem1(), 20 * 2000)
    }
    
    
    
    func testFindingSummingPair(){
        let day = Day1(expenses: [20, 10, 15])
        XCTAssertEqual(day.findPair(summingTo: 35).0, 20)
        XCTAssertEqual(day.findPair(summingTo: 35).1, 15)
    }
    
    
    func testFindingSummingTripplet(){
        let day = Day1(expenses: [20, 10, 15, 100])
        XCTAssertEqual(day.findTriplet(summingTo: 135).0, 20)
        XCTAssertEqual(day.findTriplet(summingTo: 135).1, 15)
        XCTAssertEqual(day.findTriplet(summingTo: 135).2, 100)
    }
}
