import Foundation

struct swift_2020 {
    var text = "Hello, World!"
    var inputs = Inputs()


    func run() {
        Day1(expenses: inputs.day1).run()
        Day2(strings: inputs.day2).run()
        Day3(map: inputs.day3).run()
        Day4(input: inputs.day4).run()
        Day5(inputs: inputs.day5).run()
        Day6(input: inputs.day6).run()
        Day7(bagRules: inputs.day7).run()
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

