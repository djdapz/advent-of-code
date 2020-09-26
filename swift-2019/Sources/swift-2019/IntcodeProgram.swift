//
// Created by Devon D'Apuzzo on 9/23/20.
//

import Foundation

typealias IntcodeProgram = [Int]

extension IntcodeProgram {
    func runAsIntcode() -> IntcodeProgram {
        self.processFromWord(at: 0)
    }
}

enum Operand {
    case add
    case multiply
    case terminate

    static func from(_ operand: Int) -> Operand {
        switch operand {
        case 1:
            return .add
        case 99:
            return .terminate
        case 2:
            return .multiply
        default:
            preconditionFailure("Unrecognized operand: \(operand)")
        }
    }
}

private extension IntcodeProgram {
    func firstArgumentFor(word: Int) -> Int {
        self[self[word * 4 + 1]]
    }

    func secondArgumentFor(word: Int) -> Int {
        self[self[word * 4 + 2]]
    }

    func operandFor(word: Int) -> Operand {
        Operand.from(self[word * 4])
    }

    func pivotFor(word: Int) -> Int {
        self[word * 4 + 3]
    }

    func processFromWord(at wordNumber: Int) -> [Int] {
        guard let operation = getOperation(forWord: wordNumber) else{
            return self
        }
        let firstArgument = firstArgumentFor(word: wordNumber)
        let secondArgument = secondArgumentFor(word: wordNumber)
        let pivot = pivotFor(word: wordNumber)

        let sum = operation(firstArgument, secondArgument)

        let processed = insertAt(pivot: pivot, element: sum)

        return processed.processFromWord(at: wordNumber + 1)
    }


    func getOperation(forWord wordNumber: Int) -> ((Int, Int) -> Int)? {
        let operand = operandFor(word: wordNumber)
        switch operand {
        case .add:
            return { a, b in a + b }
        case .multiply:
            return { a, b in a * b }
        case .terminate:
            return nil
        }
    }
}


private extension Array where Element: Any {

    func insertAt(pivot: Int, element: Element) -> [Element] {
        let prefix = getPrefix(from: pivot)
        let suffix = getSuffix(from: pivot)
        return prefix + [element] + suffix
    }

    func getPrefix(from: Int) -> [Element] {
        guard from > 0 else {
            return []
        }

        return Array(self[0...from - 1])
    }


    func getSuffix(from: Int) -> [Element] {
        guard from < self.count - 1 else {
            return []
        }

        return Array(self[from + 1...self.count - 1])
    }
}