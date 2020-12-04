//
// Created by Devon DaPuzzo on 12/3/20.
//

import Foundation

struct TobogganMap {

    let map: [String]
    let slope : (Int, Int)

    public static func from(mapText: String, slope: (Int, Int)) -> TobogganMap {
        TobogganMap(
            map: mapText.split(separator: "\n").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) },
            slope: slope
        )
    }

    public func didHit(onMove: Int) -> Bool? {
        guard onMove * slope.0 < map.count else {
            return nil
        }

        let row = map[slope.0 * onMove]

        let column = ((onMove * slope.1) % row.count)


        let spot = row[column]
        return spot == "#"
    }

    public func numberOfTreesHit() -> Int {
        var numberOfTrees = 0
        var move = 0

        while true {
            let hit = didHit(onMove: move)

            switch hit {
            case .none:
                return numberOfTrees
            case .some(let didHit):
                if didHit {
                    numberOfTrees = numberOfTrees + 1
                }
            }
            move = move + 1

        }
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}