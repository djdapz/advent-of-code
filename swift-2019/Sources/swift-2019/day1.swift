//
//  File.swift
//  
//
//  Created by Devon D'Apuzzo on 9/21/20.
//

import Foundation

public class Day1{

    let masses: [Int]

    init(_ masses: [Int]){
        self.masses = masses
    }

    func solve1() -> Int{
        masses.reduce(0){ prev, mass in
            prev + (mass / 3) - 2
        }
    }
}
