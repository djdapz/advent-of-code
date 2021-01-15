//
// Created by Devon Dapuzzo on 1/14/21.
//

import Foundation

enum OpCode {
    case noop
    case jump
    case add

    static func fromString(_ s: String) -> OpCode {
        switch (s) {
        case "nop":
            return .noop
        case "acc":
            return .add
        case "jmp":
            return .jump
        default:
            fatalError("Couldn't match for opcode \(s)")
        }
    }
}

struct Instruction: Hashable {
    let opCode: OpCode
    let amount: Int
}

class GameSoftware {

    let instructions: [Instruction]

    init(fromString: String) {
        instructions = fromString
                .components(separatedBy: .newlines)
                .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                .map {
                    let components = $0.components(separatedBy: " ")
                    let amount = Int(components[1].replacingOccurrences(of: "+", with: ""))!
                    let opcode = OpCode.fromString(components[0])
                    return Instruction(opCode: opcode, amount: amount)
                }
    }
}


class ProgramState {
    let program: GameSoftware
    let pointer: Int
    let accumulator: Int
    var executed: [Int: Bool]

    init(program: GameSoftware, pointer: Int, accumulator: Int, executed: [Int: Bool] = [:]) {
        self.program = program
        self.pointer = pointer
        self.accumulator = accumulator
        self.executed = executed
    }

    public func nextState() -> ProgramState? {
        guard let instruction = program.instructions[safe: pointer], executed[pointer] == nil else {
            return nil
        }

        executed[pointer] = true

        switch instruction.opCode {
        case .jump:
            return ProgramState(program: program, pointer: pointer + instruction.amount, accumulator: accumulator, executed: executed)
        case .add:
            return ProgramState(program: program, pointer: pointer + 1, accumulator: accumulator + instruction.amount, executed: executed)
        case .noop:
            return ProgramState(program: program, pointer: pointer + 1, accumulator: accumulator, executed: executed)
        }
    }

    public func run() -> Int {
        if let next = nextState() {
            return next.run()
        }

        return accumulator
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
