//
// Created by Devon D'Apuzzo on 8/10/21.
//

import Foundation

struct JoltageReader {
    let joltages: [Int]

    func differences() -> [Int] {
        ([0] + joltages).sorted()
            .mapEachGap { first, second in
                second - first
            }
            .reduce(into: [0, 0, 0, 1, 0]) { (result: inout [Int], i: Int) in
                result[i] = result[i] + 1
            }
    }

    func numberOfValidArrangements() -> Int {
        let sorted = joltages.sorted()

        var cache: [Int: Int] = [0: 1]
        for item in sorted {
            let oneJoltAway = cache[item - 1] ?? 0
            let twoJoltsAway = cache[item - 2] ?? 0
            let threeJoltsAway = cache[item - 3] ?? 0
            cache[item] =  oneJoltAway + threeJoltsAway  + twoJoltsAway
        }


        return cache[sorted.last!]!
    }
}

extension Array {
    func mapEachGap<T>(_ exec: @escaping (Element, Element) -> T) -> [T] {
        var next: [T] = []
        for index in 0...count - 2 {
            next.append(exec(self[index], self[index + 1]))
        }
        return next
    }
}
