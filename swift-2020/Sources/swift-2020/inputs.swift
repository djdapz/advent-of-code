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

    static let day1 = fileReader.read(fileName: "day1").map { $0.textFileOfNumbersToList() }.getOrNull()!

    static let day2 = fileReader.read(fileName: "day2").map { $0.textFileToListOfStrings() }.getOrNull()!

    static let day3 = fileReader.read(fileName: "day3").getOrNull()!

    static let day4 = fileReader.read(fileName: "day4").getOrNull()!

    static let day5 = fileReader.read(fileName: "day5").getOrNull()!.textFileToListOfStrings()

    static let day6 = fileReader.read(fileName: "day6").getOrNull()!

    static let day7 = fileReader.read(fileName: "day7").getOrNull()!.textFileToListOfStrings()

    static let day8 = fileReader.read(fileName: "day8").getOrNull()!

    static let day9 = fileReader.read(fileName: "day9").getOrNull()!.textFileOfNumbersToList()

    static let day10 = fileReader.read(fileName: "day10").getOrNull()!.textFileOfNumbersToList()
}
