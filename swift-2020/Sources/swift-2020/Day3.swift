//
// Created by Devon DaPuzzo on 12/2/20.
//

import Foundation


struct Day3 {

    let map: String

    func problem1() -> Int {
        TobogganMap.from(mapText: map, slope: (1, 3)).numberOfTreesHit()
    }


    func problem2() -> Int {
        let res1 = TobogganMap.from(mapText: map, slope: (1, 1)).numberOfTreesHit()
        let res2 = TobogganMap.from(mapText: map, slope: (1, 3)).numberOfTreesHit()
        let res3 = TobogganMap.from(mapText: map, slope: (1, 5)).numberOfTreesHit()
        let res4 = TobogganMap.from(mapText: map, slope: (1, 7)).numberOfTreesHit()
        let res5 = TobogganMap.from(mapText: map, slope: (2, 1)).numberOfTreesHit()

        return res1 * res2 * res3 * res4 * res5
    }
}