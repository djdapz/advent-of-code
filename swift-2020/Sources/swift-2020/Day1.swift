//
//  File.swift
//  
//
//  Created by Devon DaPuzzo on 11/30/20.
//

import Foundation

struct Day1{
    
    let expenses: [Int]
    
    func problem1() -> Int {
        let pair = findPair(summingTo: 2020)
        return pair.0 * pair.1
    }
    
    
    func problem2() -> Int {
        let pair = findTriplet(summingTo: 2020)
        return pair.0 * pair.1 * pair.2
    }
    
    
    func findPair(summingTo: Int) -> (Int, Int){
        for expense in expenses{
            for expense2 in expenses{
                if expense + expense2 == summingTo {
                    return (expense, expense2)
                }
            }
        }
        
        fatalError("no sum found")
    }
    
    func findTriplet(summingTo: Int) -> (Int, Int, Int){
        for expense in expenses{
            for expense2 in expenses{
                for expense3 in expenses{
                    if expense + expense2 + expense3 == summingTo {
                        return (expense, expense2, expense3)
                    }
                }
            }
        }
        
        fatalError("no sum found")
    }
}
