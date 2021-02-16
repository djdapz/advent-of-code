//
// Created by Devon D'Apuzzo on 12/15/20.
//

import Foundation

class Day6: Day {
    var number: Int {
        get {
            6
        }
    }

    func problem1() -> Int {
        forms.map { $0.count }.reduce(0) { a, b in a + b }
    }

    func problem2() -> Int {
        forms.map { $0.countAll }.reduce(0) { a, b in a + b }
    }

    let forms: [CustomsForm]

    init(input: String) {
        forms = input.replacingOccurrences(of: "\n\n", with: "~")
            .split(separator: "~")
            .map { String($0) }
            .map { CustomsForm(from: $0) }
    }

}
