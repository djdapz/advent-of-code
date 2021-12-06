//
//  File.swift
//  
//
//  Created by Devon DaPuzzo on 12/1/20.
//

import Foundation

extension String {
    func textFileOfNumbersToList() -> [Int] {
        textFileToListOfStrings().map { Int($0)! }
    }

    func textFileToListOfStrings() -> [String] {
        split(separator: "\n").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
    }
}

struct Inputs {
    static let fileReader = TextFileReader(basePath: "Data")

    static var day1 = fileReader.read(fileName: "day1").map { $0.textFileOfNumbersToList() }.getOrNull()!

    static var day2 = fileReader.read(fileName: "day2").map { $0.textFileToListOfStrings() }.getOrNull()!

    static var day3 = fileReader.read(fileName: "day3").getOrNull()!

    static var day4 = fileReader.read(fileName: "day4").getOrNull()!

    static var day5 = fileReader.read(fileName: "day5").getOrNull()!.textFileToListOfStrings()

    static var day6 = fileReader.read(fileName: "day6").getOrNull()!

    static var day7 = fileReader.read(fileName: "day7").getOrNull()!.textFileToListOfStrings()

    static var day8 = fileReader.read(fileName: "day8").getOrNull()!

    static var day9 = fileReader.read(fileName: "day9").getOrNull()!.textFileOfNumbersToList()

    static var day10 = fileReader.read(fileName: "day10").getOrNull()!.textFileOfNumbersToList()

    static var day11 = fileReader.read(fileName: "day11").getOrNull()!
}