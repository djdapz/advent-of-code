//
// Created by Devon DaPuzzo on 12/26/20.
//

import Foundation

struct Day8: Day {


    private var game: GameSoftware
    private var rawProgram: String

    init(program: String) {
        rawProgram = program
        self.game = GameSoftware(fromString: program)
    }

    func problem1() -> Int {
        ProgramState(program: game, pointer: 0, accumulator: 0).run().accumulator


    }

    private func getIndeces(ofCommands command: OpCode) -> [Int] {
        game.instructions.enumerated().filter { (index, element) in
            element.opCode == .jump
        }.map { (index, element) in
            index
        }
    }

    private func run(withCommand command: OpCode, atIndex index: Int) -> ProgramState {
        let toBeChanged = self.game.instructions[index]
        let updated = Instruction(opCode: command, amount: toBeChanged.amount)

        var newInstructions = self.game.instructions
        newInstructions[index] = updated
        let newGame = GameSoftware(fromInstructions: newInstructions)
        return ProgramState(program: newGame, pointer: 0, accumulator: 0).run()
    }

    private func funTrySwapping(command: OpCode, with: OpCode) -> Int? {
        for index in getIndeces(ofCommands: command) {
            let result = run(withCommand: with, atIndex: index)
            if result.terminationReason == .successfulTermination {
                return result.accumulator
            }
        }
        return nil
    }


    func problem2() -> Int {
        if let jumpSwitchResult = funTrySwapping(command: .jump, with: .noop) {
            return jumpSwitchResult
        }
        if let noopSwichResult = funTrySwapping(command: .noop, with: .jump) {
            return noopSwichResult
        }

        return -1
    }

    private(set) var number: Int = 8
}