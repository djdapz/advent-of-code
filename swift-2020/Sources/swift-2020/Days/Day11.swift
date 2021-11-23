//
// Created by Devon D'Apuzzo on 8/10/21.
//

import Foundation

class Day11: Day {
    let number: Int = 11

    private var reader: JoltageReader

    init(joltages: [Int]) {
        reader = JoltageReader(joltages: joltages)
    }

    func problem1() -> Int {
        let diffs = reader.differences()
        return diffs[1] * diffs[3]
    }

    func problem2() -> Int {
        reader.numberOfValidArrangements()
    }
}