//
//  File.swift
//  
//
//  Created by Devon DaPuzzo on 11/30/20.
//

import Foundation

struct Day1: Day {
    var number: Int {
        get {
            1
        }
    }


    let expenses: [Int]
    let set: Set<Int>

    init(expenses: [Int]) {
        self.expenses = expenses
        set = Set(expenses)
    }

    func problem1() -> Int {
        let pair = findPair(summingTo: 2020)
        return pair.0 * pair.1
    }


    func problem2() -> Int {
        let pair = findTriplet(summingTo: 2020)
        return pair.0 * pair.1 * pair.2
    }


    func findPair(summingTo: Int) -> (Int, Int) {
        for expense in expenses {
            let expense2 = summingTo - expense
            if set.contains(expense2) {
                return (expense, expense2)
            }
        }

        fatalError("no sum found")
    }

    func findTriplet(summingTo: Int) -> (Int, Int, Int) {
        for expense in expenses {
            for expense2 in expenses {
                let expense3 = summingTo - expense2 - expense
                if set.contains(expense3) {
                    return (expense, expense2, expense3)
                }
            }
        }

        fatalError("no sum found")
    }
}
