//
// Created by Devon D'Apuzzo on 11/22/21.
//

import Foundation

extension Result{

    func getOrNull() -> Success?{
        switch self{
        case .success(let a):
            return a
        case .failure:
            return nil
        }
    }
}