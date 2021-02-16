//
// Created by Devon D'Apuzzo on 12/11/20.
//

import Foundation

class Day4 : Day{
    var number: Int {
        get {
            4
        }
    }
    let passports: [PassportValidator]

    init(input: String) {
        passports = input.replacingOccurrences(of: "\n\n", with: "~")
            .split(separator: "~")
            .map { String($0) }
            .map { PassportValidator(fromString: $0) }
    }

    func problem1() -> Int {
        passports.filter { $0.isPropperlyFormed }.count
    }

    func problem2() -> Int {
        passports.filter { $0.isValid }.count
    }
}
