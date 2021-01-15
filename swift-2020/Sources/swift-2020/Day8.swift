//
// Created by Devon DaPuzzo on 12/26/20.
//

import Foundation

struct Day8: Day {


    private var game: GameSoftware

    init(program: String) {
        self.game = GameSoftware(fromString: program)
    }

    func problem1() -> Int {
        ProgramState(program: game, pointer: 0, accumulator: 0).run()
    }

    func problem2() -> Int {
        -1
    }

    private(set) var number: Int = 8
}