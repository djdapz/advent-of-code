//
// Created by Devon DaPuzzo on 12/2/20.
//

import Foundation

extension Bool {
    static func ^ (left: Bool, right: Bool) -> Bool {
        left != right
    }
}

struct Password {

    private let specialLetter: Character
    private let firstParameter: Int
    private let secondParameter: Int
    private let password: Array<Character>

    public var isValid: Bool {
        get {
            let exceedsMinimum = password.filter { $0 == specialLetter }.count >= firstParameter
            let isWithinMaximum = password.filter { $0 == specialLetter }.count <= secondParameter
            return exceedsMinimum && isWithinMaximum
        }
    }

    public var isValidReal: Bool {
        get {
            let matchesFirst = Array(password)[firstParameter - 1] == specialLetter
            let matchesSecond = Array(password)[secondParameter - 1] == specialLetter

            return matchesFirst ^ matchesSecond
        }
    }

    init(_ string: String) {
        let elements = string.components(separatedBy: " ")
        let ranges: [Int?] = elements[0].components(separatedBy: "-").map(Int.init)
        specialLetter = elements[1].first!
        firstParameter = ranges[0]!
        secondParameter = ranges[1]!
        password = Array(elements[2])
    }
}

struct Day2 {

    let passwords: [Password]

    init(strings: [String]) {
        passwords = strings.map(Password.init)
    }

    func problem1() -> Int {
        passwords.filter {
            $0.isValid
        }.count
    }

    func problem2() -> Int{
        passwords.filter {
            $0.isValidReal
        }.count
    }
}