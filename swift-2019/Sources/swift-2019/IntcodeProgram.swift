//
// Created by Devon D'Apuzzo on 9/23/20.
//

import Foundation

typealias IntcodeProgram = [Int]

extension IntcodeProgram {
    func runAsIntcode() -> IntcodeProgram {
        self.processInstructions(startingAt: 0)
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
    func firstParameterFor(instructionPointer: Int) -> Int {
        self[self[instructionPointer + 1]]
    }

    func secondParameterFor(instructionPointer: Int) -> Int {
        self[self[instructionPointer  + 2]]
    }

    func operandFor(instructionPointer: Int) -> Operand {
        Operand.from(self[instructionPointer])
    }

    func pivotFor(instructionPointer: Int) -> Int {
        self[instructionPointer + 3]
    }

    func processInstructions(startingAt pointer: Int) -> [Int] {
        guard let operation = getOperation(from: pointer) else{
            return self
        }
        let firstParameter = firstParameterFor(instructionPointer: pointer)
        let secondParameter = secondParameterFor(instructionPointer: pointer)
        let pivot = pivotFor(instructionPointer: pointer)

        let sum = operation(firstParameter, secondParameter)

        let processed = insertAt(pivot: pivot, element: sum)

        return processed.processInstructions(startingAt: pointer + 4)
    }


    func getOperation(from pointer: Int) -> ((Int, Int) -> Int)? {
        let operand = operandFor(instructionPointer: pointer)
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


extension Array where Element: Any {

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