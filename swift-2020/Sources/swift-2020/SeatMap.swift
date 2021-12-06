//
// Created by Devon D'Apuzzo on 11/22/21.
//

import Foundation

enum SeatStatus: Character {
    case empty = "L"
    case floor = "."
    case occupied = "#"
}

struct SeatMap: Equatable {

    let seats: [[SeatStatus]]

    init(layout: String) {
        seats = layout.textFileToListOfStrings().map { row in
            row.map { (seat: Character) in
                SeatStatus(rawValue: seat)!
            }
        }
    }

    init(seats: [[SeatStatus]]) {
        self.seats = seats
    }

    public func iterate() -> SeatMap {
        let newSeats: [[SeatStatus]] = seats.enumerated().map { (rowNum, row) in
            row.enumerated().map { (colNum, seat) in
                let score = findNeighborScore(rowNum: rowNum, colNum: colNum)
                switch seat {
                case .empty:
                    return score == 0 ? .occupied : .empty
                case .floor:
                    return .floor
                case .occupied:
                    return score < 4 ? .occupied : .empty
                }
            }
        }
        return SeatMap(seats: newSeats)
    }

    private func findNeighborScore(rowNum: Int, colNum: Int) -> Int {
        score(rowNum: rowNum + 1, colNum: colNum - 1)
            + score(rowNum: rowNum + 1, colNum: colNum)
            + score(rowNum: rowNum + 1, colNum: colNum + 1)
            + score(rowNum: rowNum, colNum: colNum - 1)
            + score(rowNum: rowNum, colNum: colNum + 1)
            + score(rowNum: rowNum - 1, colNum: colNum + 1)
            + score(rowNum: rowNum - 1, colNum: colNum)
            + score(rowNum: rowNum - 1, colNum: colNum - 1)
    }

    func score(rowNum: Int, colNum: Int) -> Int {
        safeRead(rowNum: rowNum, colNum: colNum) == .occupied ? 1 : 0
    }

    func safeRead(rowNum: Int, colNum: Int) -> SeatStatus? {
        guard rowNum >= 0, colNum >= 0, seats.count > rowNum, seats[rowNum].count > colNum else {
            return nil
        }
        return seats[rowNum][colNum]
    }

    public func findSteadyState() -> SeatMap {
        let next = iterate()

        if next == self {
            return self
        }

        return next.findSteadyState()
    }

    func toString() -> String {
        seats.map { row in String(row.map { $0.rawValue }) }.joined(separator: "\n")
    }

}
