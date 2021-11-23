import Foundation

public struct swift_2020 {

    public static func run() {
        let start = Date()

        Day1(expenses: Inputs.day1).run()
        Day2(strings: Inputs.day2).run()
        Day3(map: Inputs.day3).run()
        Day4(input: Inputs.day4).run()
        Day5(inputs: Inputs.day5).run()
        Day6(input: Inputs.day6).run()
        Day7(bagRules: Inputs.day7).run()
        Day8(program: Inputs.day8).run()
        Day9(xmasCode: Inputs.day9).run()
        Day10(joltages: Inputs.day10).run()

        print("")
        print("Total Time: | \(Date().timeIntervalSince(start)) seconds")
    }
}

extension Day {
    func run() {
        let start = Date()
        print("------+-----")
        print("Day \(number) | 1) \(problem1())")
        print("      | 2) \(problem2())")
        print("      | \(Date().timeIntervalSince(start)) seconds")
    }
}

