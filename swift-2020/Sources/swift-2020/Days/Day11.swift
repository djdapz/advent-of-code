//
// Created by Devon D'Apuzzo on 8/10/21.
//

import Foundation


class Day11: Day {
    let number: Int = 11

    private var seatMap: SeatMap

    init(_ seatMap: String) {
        self.seatMap = SeatMap(layout: seatMap)
    }

    func problem1() -> Int {
        seatMap.findSteadyState().seats.reduce(0) { (sum, row) in
            row.filter { $0 == .occupied }.count + sum
        }
    }

    func problem2() -> Int {
        0
    }
}