//
// Created by Devon D'Apuzzo on 12/14/20.
//

import Foundation

struct Day5: Day {
    var number: Int {
        get {
            5
        }
    }
    let passes: [BoardingPass]

    init(inputs: [String]) {
        passes = inputs.map { BoardingPass(from: $0) }
    }

    func problem1() -> Int {
        passes.map { $0.id }.max()!
    }

    func problem2() -> Int {
        let set: Set = Set(passes.map { $0.id })

        for row in 1...126 {
            for col in 0...7 {
                let id = row * 8 + col
                if !set.contains(id)
                       && set.contains(id + 1)
                       && set.contains(id - 1) {
                    return id
                }
            }
        }

        return 1
    }
}