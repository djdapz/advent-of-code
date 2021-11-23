//
// Created by Devon D'Apuzzo on 11/22/21.
//

import Foundation
import XCTest

func assertSuccessEqualTo<S: Equatable, E>(_ result: Result<S, E>, _  expectedValue: S) {
    switch result {
    case .success(let value):
        XCTAssertEqual(value, expectedValue)
    case .failure(let error):
        XCTFail("Expected result to be of type succes, was a failure: \(error)")
    }
}


func assertSuccess<S: Equatable, E>(_ result: Result<S, E>, _  assertions: (S) -> ()) {
    switch result {
    case .success(let value):
        assertions(value)
    case .failure(let error):
        XCTFail("Expected result to be of type succes, was a failure: \(error)")
    }
}

func assertContains(text: String, target: String){
   if(!text.contains(target)){
       XCTFail("Expected text: \(text) \nTo Contain: \(target)")
   }
}