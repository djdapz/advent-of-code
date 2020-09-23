//
//  File.swift
//  
//
//  Created by Devon D'Apuzzo on 9/21/20.
//

import Foundation

public class Day1{

    let masses: [Mass]

    init(_ masses: [Int]){
        self.masses = masses.map{Mass($0)}
    }

    func solve1() -> Int{
        masses.reduce(0){ prev, mass in
            prev + mass.getFuelNeeded()
        }
    }

    func solve2() -> Int{
        masses.reduce(0){ prev, mass in
            prev + mass.getRecursiveFuelNeeded()
        }
    }
}

class Mass{

    private let value: Int

    init(_ value: Int){
        self.value = value
    }

    func getFuelNeeded() -> Int {
        Swift.max((value / 3) - 2, 0)
    }

    func getRecursiveFuelNeeded() -> Int{
        let fuelForThisLoad = getFuelNeeded()

        guard fuelForThisLoad > 0 else {
            return fuelForThisLoad
        }

        return fuelForThisLoad + Mass(fuelForThisLoad).getRecursiveFuelNeeded()
    }
}
