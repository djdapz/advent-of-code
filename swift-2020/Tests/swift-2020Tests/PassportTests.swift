//
// Created by Devon D'Apuzzo on 12/11/20.
//


import Foundation

import XCTest
@testable import swift_2020


class PassportTests: XCTestCase {

    func test_shouldTellMeImValidWhenIHaveAllFields() {
        let passport = PassportValidator(fromString: "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd\nbyr:1937 iyr:2017 cid:147 hgt:183cm")
        XCTAssertTrue(passport.isPropperlyFormed)
    }


    func test_shouldTellMeImInvalidWhenImMissingExpirationYear() {
        let passport = PassportValidator(fromString: "ecl:gry pid:860033327 hcl:#fffffd\nbyr:1937 iyr:2017 cid:147 hgt:183cm")
        XCTAssertFalse(passport.isPropperlyFormed)
    }


    func test_shouldTellMeImInvalidWhenImMissingHeight() {
        let passport = PassportValidator(fromString: "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd\nbyr:1937 iyr:2017 cid:147")
        XCTAssertFalse(passport.isPropperlyFormed)
    }

    func test_shouldTellMeImInvalidWhenImMissingEyeColor() {
        let passport = PassportValidator(fromString: "pid:860033327 eyr:2020 hcl:#fffffd\nbyr:1937 iyr:2017 cid:147 hgt:183cm")
        XCTAssertFalse(passport.isPropperlyFormed)
    }

    func test_shouldTellMeImInvalidWhenImMissingPassportId() {
        let passport = PassportValidator(fromString: "ecl:gry eyr:2020 hcl:#fffffd\nbyr:1937 iyr:2017 cid:147 hgt:183cm")
        XCTAssertFalse(passport.isPropperlyFormed)
    }

    func test_shouldTellMeImInvalidWhenImMissingHairColor() {
        let passport = PassportValidator(fromString: "ecl:gry pid:860033327 eyr:2020\nbyr:1937 iyr:2017 cid:147 hgt:183cm")
        XCTAssertFalse(passport.isPropperlyFormed)
    }

    func test_shouldTellMeImInvalidWhenImMissingBirthYear() {
        let passport = PassportValidator(fromString: "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd\niyr:2017 cid:147 hgt:183cm")
        XCTAssertFalse(passport.isPropperlyFormed)
    }

    func test_shouldTellMeImInvalidWhenImMissingIssueYear() {
        let passport = PassportValidator(fromString: "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd\nbyr:1937 cid:147 hgt:183cm")
        XCTAssertFalse(passport.isPropperlyFormed)
    }

    func test_shouldAllowAPassportWithNoCountryId() {
        let passport = PassportValidator(fromString: "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd\nbyr:1937 iyr:2017 hgt:183cm")
        XCTAssertTrue(passport.isPropperlyFormed)
    }

    func test_shouldValidateBirthyear() {
        XCTAssertTrue(PassportValidator(fromString: "byr:2000 pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 hcl:#623a2f")
            .isValid)
        XCTAssertTrue(PassportValidator(fromString: "byr:2002 pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 hcl:#623a2f")
            .isValid)
        XCTAssertTrue(PassportValidator(fromString: "byr:1920 pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 hcl:#623a2f")
            .isValid)

        XCTAssertFalse(PassportValidator(fromString: "byr:2003 pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 hcl:#623a2f")
            .isValid)
        XCTAssertFalse(PassportValidator(fromString: "byr:1919 pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 hcl:#623a2f")
            .isValid)
        XCTAssertFalse(PassportValidator(fromString: "byr:haha pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 hcl:#623a2f")
            .isValid)
    }

    func test_shouldValidateIssueYear() {
        XCTAssertTrue(PassportValidator(fromString: "iyr:2010 byr:2000 pid:087499704 hgt:74in ecl:grn eyr:2030 hcl:#623a2f")
            .isValid)
        XCTAssertTrue(PassportValidator(fromString: "iyr:2020 byr:2000 pid:087499704 hgt:74in ecl:grn eyr:2030 hcl:#623a2f")
            .isValid)

        XCTAssertFalse(PassportValidator(fromString: "iyr:2009 byr:2000 pid:087499704 hgt:74in ecl:grn eyr:2030 hcl:#623a2f")
            .isValid)
        XCTAssertFalse(PassportValidator(fromString: "iyr:2021 byr:2000 pid:087499704 hgt:74in ecl:grn eyr:2030 hcl:#623a2f")
            .isValid)
        XCTAssertFalse(PassportValidator(fromString: "iyr:haha byr:2000 pid:087499704 hgt:74in ecl:grn eyr:2030 hcl:#623a2f")
            .isValid)
    }

    func test_shouldValidateExpiration() {
        XCTAssertTrue(PassportValidator(fromString: "eyr:2030 iyr:2011 byr:2000 pid:087499704 hgt:74in ecl:grn hcl:#623a2f")
            .isValid)
        XCTAssertTrue(PassportValidator(fromString: "eyr:2020 iyr:2011 byr:2000 pid:087499704 hgt:74in ecl:grn hcl:#623a2f")
            .isValid)

        XCTAssertFalse(PassportValidator(fromString: "eyr:2031 iyr:2011 byr:2000 pid:087499704 hgt:74in ecl:grn hcl:#623a2f")
            .isValid)
        XCTAssertFalse(PassportValidator(fromString: "eyr:2019 iyr:2011 byr:2000 pid:087499704 hgt:74in ecl:grn hcl:#623a2f")
            .isValid)
        XCTAssertFalse(PassportValidator(fromString: "eyr:haha iyr:2011 byr:2000 pid:087499704 hgt:74in ecl:grn hcl:#623a2f")
            .isValid)
    }

    func test_shouldValidatePassportNumbers() {
        XCTAssertTrue(PassportValidator(fromString: "pid:187499704 eyr:2030 iyr:2011 byr:2000 hgt:74in ecl:grn hcl:#623a2f")
            .isValid)
        XCTAssertTrue(PassportValidator(fromString: "pid:087499705 eyr:2030 iyr:2011 byr:2000 hgt:74in ecl:grn hcl:#623a2f")
            .isValid)
        XCTAssertFalse(PassportValidator(fromString: "pid:18749970 eyr:2030 iyr:2011 byr:2000 hgt:74in ecl:grn hcl:#623a2f")
            .isValid)
        XCTAssertFalse(PassportValidator(fromString: "pid:18749970D eyr:2030 iyr:2011 byr:2000 hgt:74in ecl:grn hcl:#623a2f")
            .isValid)
    }

    func test_shouldValidateEyeColor() {
        XCTAssertTrue(PassportValidator(fromString: "ecl:amb pid:187499704 eyr:2030 iyr:2011 byr:2000 hgt:74in hcl:#623a2f").isValid)
        XCTAssertTrue(PassportValidator(fromString: "ecl:blu pid:187499704 eyr:2030 iyr:2011 byr:2000 hgt:74in hcl:#623a2f").isValid)
        XCTAssertTrue(PassportValidator(fromString: "ecl:brn pid:187499704 eyr:2030 iyr:2011 byr:2000 hgt:74in hcl:#623a2f").isValid)
        XCTAssertTrue(PassportValidator(fromString: "ecl:gry pid:187499704 eyr:2030 iyr:2011 byr:2000 hgt:74in hcl:#623a2f").isValid)
        XCTAssertTrue(PassportValidator(fromString: "ecl:grn pid:187499704 eyr:2030 iyr:2011 byr:2000 hgt:74in hcl:#623a2f").isValid)
        XCTAssertTrue(PassportValidator(fromString: "ecl:hzl pid:187499704 eyr:2030 iyr:2011 byr:2000 hgt:74in hcl:#623a2f").isValid)
        XCTAssertTrue(PassportValidator(fromString: "ecl:oth pid:187499704 eyr:2030 iyr:2011 byr:2000 hgt:74in hcl:#623a2f").isValid)
        XCTAssertFalse(PassportValidator(fromString: "ecl:idk pid:187499704 eyr:2030 iyr:2011 byr:2000 hgt:74in hcl:#623a2f").isValid)
    }

    func test_shouldValidateHairColor() {
        XCTAssertTrue(PassportValidator(fromString: "hcl:#623a2f ecl:amb pid:187499704 eyr:2030 iyr:2011 byr:2000 hgt:74in").isValid)
        XCTAssertFalse(PassportValidator(fromString: "hcl:9623a2f ecl:amb pid:187499704 eyr:2030 iyr:2011 byr:2000 hgt:74in").isValid)
        XCTAssertFalse(PassportValidator(fromString: "hcl:#623a2fe ecl:amb pid:187499704 eyr:2030 iyr:2011 byr:2000 hgt:74in").isValid)
        XCTAssertFalse(PassportValidator(fromString: "hcl:#623g2f ecl:amb pid:187499704 eyr:2030 iyr:2011 byr:2000 hgt:74in").isValid)
    }

    func test_shouldValidateHeightInInches() {
        XCTAssertTrue(PassportValidator(fromString: "hgt:59in ecl:amb hcl:#623a2f pid:187499704 eyr:2030 iyr:2011 byr:2000").isValid)
        XCTAssertTrue(PassportValidator(fromString: "hgt:60in ecl:amb hcl:#623a2f pid:187499704 eyr:2030 iyr:2011 byr:2000").isValid)
        XCTAssertTrue(PassportValidator(fromString: "hgt:76in ecl:amb hcl:#623a2f pid:187499704 eyr:2030 iyr:2011 byr:2000").isValid)

        XCTAssertFalse(PassportValidator(fromString: "hgt:77in ecl:amb hcl:#623a2f pid:187499704 eyr:2030 iyr:2011 byr:2000").isValid)
        XCTAssertFalse(PassportValidator(fromString: "hgt:58in ecl:amb hcl:#623a2f pid:187499704 eyr:2030 iyr:2011 byr:2000").isValid)
    }

    func test_shouldValidateHeightInCm() {
        XCTAssertTrue(PassportValidator(fromString: "hgt:150cm ecl:amb hcl:#623a2f pid:187499704 eyr:2030 iyr:2011 byr:2000").isValid)
        XCTAssertTrue(PassportValidator(fromString: "hgt:175cm ecl:amb hcl:#623a2f pid:187499704 eyr:2030 iyr:2011 byr:2000").isValid)
        XCTAssertTrue(PassportValidator(fromString: "hgt:193cm ecl:amb hcl:#623a2f pid:187499704 eyr:2030 iyr:2011 byr:2000").isValid)

        XCTAssertFalse(PassportValidator(fromString: "hgt:149cm ecl:amb hcl:#623a2f pid:187499704 eyr:2030 iyr:2011 byr:2000").isValid)
        XCTAssertFalse(PassportValidator(fromString: "hgt:194cm ecl:amb hcl:#623a2f pid:187499704 eyr:2030 iyr:2011 byr:2000").isValid)
    }
}
