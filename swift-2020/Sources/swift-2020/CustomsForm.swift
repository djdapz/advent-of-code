//
// Created by Devon D'Apuzzo on 12/15/20.
//

import Foundation

class CustomsForm {

    let count: Int
    let countAll: Int

    init(from: String) {
        count = Set(from.replacingOccurrences(of: "\n", with: "")).count
        countAll = from.split(separator: "\n")
            .map { Set($0) }
            .reduce(Set("abcdefghijklmnopqrstuvwxyz")) { a, b in a.intersection(b) }
            .count
    }
}
