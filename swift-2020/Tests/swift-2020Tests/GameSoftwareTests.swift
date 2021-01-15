//
// Created by Devon Dapuzzo on 1/14/21.
//

import Foundation

import XCTest
@testable import swift_2020

class GameSoftwareTests: XCTestCase {

    func test_shouldIncrementByTheAccumulator() {
        let accumulator = ProgramState(
                program: GameSoftware(fromString: "acc +12"),
                pointer: 0,
                accumulator: 1
        ).nextState()?.accumulator
        XCTAssertEqual(accumulator, 13)
    }

    func test_shouldIncrementByTheAccumulatorUsingPointer() {
        let accumulator = ProgramState(
                program: GameSoftware(
                        fromString: """
                                    acc +12
                                    acc +15
                                    """),
                pointer: 1,
                accumulator: 1
        ).nextState()?.accumulator
        XCTAssertEqual(accumulator, 16)
    }

    func test_shouldHandleSubtractions() {
        let accumulator = ProgramState(
                program: GameSoftware(fromString: "acc -12"),
                pointer: 0,
                accumulator: 100
        ).nextState()?.accumulator
        XCTAssertEqual(accumulator, 88)
    }

    func test_shouldRunSequenceOfAdders() {
        let program = GameSoftware(fromString: """
                                                                       acc +12
                                                                       acc +15
                                                                       acc +9
                                                                       acc -3
                                               """)

        let programState = ProgramState(program: program, pointer: 0, accumulator: 0)

        let accumulator = programState.run()

        XCTAssertEqual(accumulator, 12 + 15 + 9 - 3)
    }


    func test_shouldUseJmpToSkip() {
        let program = GameSoftware(fromString: """
                                               acc +1
                                               acc +1
                                               jmp +4
                                               acc +100
                                               acc +100
                                               acc +100
                                               acc +1
                                               """)

        let programState = ProgramState(program: program, pointer: 0, accumulator: 0)

        let accumulator = programState.run()

        XCTAssertEqual(accumulator, 3)
    }

    func test_shouldIgnoreNoop() {
        let program = GameSoftware(fromString: """
                                               nop +0
                                               acc +1
                                               jmp +4
                                               acc +100
                                               acc +100
                                               acc +100
                                               acc +1
                                               """)

        let programState = ProgramState(program: program, pointer: 0, accumulator: 0)

        let accumulator = programState.run()

        XCTAssertEqual(accumulator, 2)
    }


    func test_shouldTerminateOnceAnInstructionIsReachedTwice() {
        let program = GameSoftware(fromString: """
                                               nop +0
                                               acc +1
                                               jmp +4
                                               acc +100
                                               acc +100
                                               acc +100
                                               acc +1
                                               acc +1
                                               acc +1
                                               jmp -9
                                               """)

        let programState = ProgramState(program: program, pointer: 0, accumulator: 0)

        let accumulator = programState.run()

        XCTAssertEqual(accumulator, 4)
    }

}
