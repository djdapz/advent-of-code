//
// Created by Devon Dapuzzo on 10/1/20.
//

import Foundation

struct Day3: Day {
    let wire1: Wire
    let wire2: Wire

    func solve1() -> Int {
        intersections(wire2, wire1).map { $0.manhattanDistanceToOrigin }.min() ?? 0
    }

    func solve2() -> Int {
        bestSteps(wire1, wire2)
    }
}
