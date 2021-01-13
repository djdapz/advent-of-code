//
// Created by Devon D'Apuzzo on 12/12/20.
//

import Foundation

class BoardingPass {
    let row: Int
    let col: Int
    let id: Int

    init(from: String) {
        var possibleMaxRow = 127
        var possibleMinRow = 0

        for i in 0..<7 {
            let row = RowDecision.init(rawValue: String(from[i]))!
            let diff = Int(truncating: NSDecimalNumber(decimal: pow(2.0, 7 - i - 1)))

            switch row {
            case .Front:
                possibleMaxRow = possibleMaxRow - diff
            case .Back:
                possibleMinRow = possibleMinRow + diff
            }
        }

        var possibleMaxCol = 7
        var possibleMinCol = 0

        for i in 0..<3 {
            let col = ColDecision.init(rawValue: String(from[i + 7]))!
            let diff = Int(truncating: NSDecimalNumber(decimal: pow(2.0, 3 - i - 1)))

            switch col {
            case .Left:
                possibleMaxCol = possibleMaxCol - diff
            case .Right:
                possibleMinCol = possibleMinCol + diff
            }
        }



        row = possibleMaxRow
        col = possibleMaxCol
        id = row * 8 + col
    }
}

enum RowDecision: String {
    case Front = "F"
    case Back = "B"
}
enum ColDecision: String {
    case Left = "L"
    case Right = "R"
}

