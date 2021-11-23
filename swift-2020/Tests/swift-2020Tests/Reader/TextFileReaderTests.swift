//
// Created by Devon D'Apuzzo on 11/22/21.
//

import Foundation

import Foundation
import XCTest
@testable import swift_2020

class TextFileReaderTests: XCTestCase {

    func test_reads_file_from_bundle() {
        let result = TextFileReader(basePath: "Data").read(fileName: "test")
        assertSuccessEqualTo(result, "hello world")
    }
    
    func test_read_day_1(){
        let result = TextFileReader(basePath: "Data").read(fileName: "day1")
        assertSuccess(result){
            assertContains(text: $0, target: "1867")
            assertContains(text: $0, target: "1093")
            assertContains(text: $0, target: "1781")
        }
    }
}
