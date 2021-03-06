//
// Created by Devon DaPuzzo on 12/26/20.
//

import Foundation

struct Day7 : Day {

    let bagRules: [String]
    let bagMap: BagMap

    init(bagRules: [String]) {
        self.bagRules = bagRules
        bagMap = BagMap(bagRules)
    }

    func problem1() -> Int {
        bagMap.allAncestors(for: "shiny gold").count
    }

    func problem2() -> Int {
        bagMap.capacity(for: "shiny gold")
    }

    private(set) var number: Int = 7
}