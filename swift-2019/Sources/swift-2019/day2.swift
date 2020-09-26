//
//  File.swift
//  
//
//  Created by Devon D'Apuzzo on 9/21/20.
//

import Foundation

public class Day2{

    let program: IntcodeProgram

    init(_ program: [Int]){
        self.program = program
    }

    func solve1() -> Int{
        program.runAsIntcode()[0]
    }
}