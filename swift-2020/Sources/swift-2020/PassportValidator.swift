//
// Created by Devon D'Apuzzo on 12/11/20.
//

import Foundation

struct PassportValidator {

    let isPropperlyFormed: Bool
    let isValid: Bool

    static let availableEyeColors = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]

    init(fromString inputString: String) {

        let json = "{ \"" + inputString
            .replacingOccurrences(of: "\n", with: " ")
            .replacingOccurrences(of: " ", with: "\" , \"")
            .replacingOccurrences(of: ":", with: "\" : \"")
            + "\"}"

        let dictionary = convertToDictionary(text: json)


        guard let birthYear = dictionary["byr"] as? String,
              let eyeColor = dictionary["ecl"] as? String,
              let height = dictionary["hgt"] as? String,
              let passportId = dictionary["pid"] as? String,
              let hairColor = dictionary["hcl"] as? String,
              let expiryYear = dictionary["eyr"] as? String,
              let issuedYear = dictionary["iyr"] as? String
            else {
            isValid = false
            isPropperlyFormed = false
            return
        }
        isPropperlyFormed = true


        guard
            birthYear.isWithinRange(min: 1920, max: 2002),
            issuedYear.isWithinRange(min: 2010, max: 2020),
            expiryYear.isWithinRange(min: 2020, max: 2030),
            passportId.isNumberWith(digits: 9),
            eyeColor.isOneOf(options: PassportValidator.availableEyeColors),
            hairColor.isValidHexString(),
            height.isValidHeight() else {
            isValid = false
            return
        }


        isValid = true
    }


}


private extension String {
    func isWithinRange(min: Int, max: Int) -> Bool {
        guard let subject = Int(self),
              subject >= min,
              subject <= max else {
            return false
        }

        return true
    }


    func isNumberWith(digits: Int) -> Bool {
        guard let _ = Int(self),
              count == digits else {
            return false
        }
        return true
    }


    func isOneOf(options: [String]) -> Bool {
        options.contains(self)
    }


    func isValidHeight() -> Bool {
        if hasSuffix("in") {
            return replacingOccurrences(of: "in", with: "").isWithinRange(min: 59, max: 76)
        }
        if hasSuffix("cm") {
            return replacingOccurrences(of: "cm", with: "").isWithinRange(min: 150, max: 193)
        }

        return false
    }

    func isValidHexString() -> Bool {
        hasPrefix("#")
            && count == 7
            && UInt(replacingOccurrences(of: "#", with: ""), radix: 16) != nil
    }


}


func convertToDictionary(text: String) -> [String: Any] {
    try! JSONSerialization.jsonObject(with: text.data(using: .utf8)!, options: []) as! [String: Any]
}