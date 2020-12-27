//
// Created by Devon DaPuzzo on 12/26/20.
//

import Foundation
import XCTest
@testable import swift_2020

class BagMapTests: XCTestCase {

    func test_create_a_two_node_graph() {
        let map = BagMap(["light red bags contain 1 bright white bag, 2 muted yellow bags."])

        XCTAssertEqual(map.parents(for: "muted yellow"), ["light red"])
    }

    func test_create_a_graph_with_multiple_parents() {
        let map = BagMap([
            "light red bags contain 1 bright white bag, 2 muted yellow bags.",
            "dark orange bags contain 3 bright white bags, 4 muted yellow bags."
        ])

        XCTAssertEqual(map.parents(for: "muted yellow"), ["light red", "dark orange"])
    }

    func test_create_a_graph_where_parents_have_been_children_too() {
        let map = BagMap([
            "light red bags contain 1 bright white bag, 2 muted yellow bags.",
            "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
            "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags."
        ])

        XCTAssertEqual(map.parents(for: "muted yellow"), ["light red", "dark orange"])
    }

    func test_figure_out_all_ancestors() {
        let map = BagMap([
            "light red bags contain 1 bright white bag, 2 muted yellow bags.",
            "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
            "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags."
        ])

        XCTAssertEqual(map.allAncestors(for: "shiny gold").sorted(), ["muted yellow", "dark orange", "light red"].sorted())
    }

    func test_works_on_example() {
        let map = BagMap(["light red bags contain 1 bright white bag, 2 muted yellow bags.",
                          "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
                          "bright white bags contain 1 shiny gold bag.",
                          "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.",
                          "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.",
                          "dark olive bags contain 3 faded blue bags, 4 dotted black bags.",
                          "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.",
                          "faded blue bags contain no other bags.",
                          "dotted black bags contain no other bags."])

        let ancestors = map.allAncestors(for: "shiny gold")
        XCTAssertEqual(ancestors.count, 4)
    }

    func test_tells_me_how_many_bags_i_hold() {
        let map = BagMap(["light red bags contain 1 bright white bag, 2 muted yellow bags."])

        XCTAssertEqual(map.capacity(for: "light red"), 3)
    }

    func test_tells_me_how_many_bags_i_hold_when_there_are_children() {
        let map = BagMap([
            "light red bags contain 1 bright white bag, 2 muted yellow bags.",
            "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
            "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.",
            "shiny gold bags contain 3 bright green bags"
        ])

        XCTAssertEqual(map.capacity(for: "light red"), (9 + 6) * 2 + 1)
    }

    func test_tells_me_how_many_bags_i_hold_for_example() {
        let map = BagMap(["light red bags contain 1 bright white bag, 2 muted yellow bags.",
                          "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
                          "bright white bags contain 1 shiny gold bag.",
                          "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.",
                          "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.",
                          "dark olive bags contain 3 faded blue bags, 4 dotted black bags.",
                          "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.",
                          "faded blue bags contain no other bags.",
                          "dotted black bags contain no other bags."])

        let capacity = map.capacity(for: "shiny gold")
        XCTAssertEqual(capacity, 32)
    }
}
