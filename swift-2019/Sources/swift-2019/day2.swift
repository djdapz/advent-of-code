//
//  File.swift
//  
//
//  Created by Devon D'Apuzzo on 9/21/20.
//

import Foundation

struct Day2 {

    let program: IntcodeProgram
    let desiredValue: Int


    func solve1() -> Int {
        program.runAsIntcode()[0]
    }

    func solve2() -> Int {
        for noun in 0...99 {
            for verb in 0...99 {
                let testInput = program
                    .insertAt(pivot: 1, element: noun)
                    .insertAt(pivot: 2, element: verb)
                let solved = testInput.runAsIntcode()

                if solved[0] == desiredValue{
                    return 100 * noun + verb
                }
            }
        }
        fatalError("Unable to find match for intcode noun/verb search")
    }

}