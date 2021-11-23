//
// Created by Devon D'Apuzzo on 11/22/21.
//

import Foundation

struct TextFileReader {
    let basePath : String
    func read(fileName: String) -> Result<String, FileReadingError> {
        if let url = Bundle.module.url(forResource: "\(fileName)", withExtension: "txt", subdirectory: basePath){
            do {
                let contents = try String(contentsOf: url, encoding: .utf8)
                return Result.success(contents)
            } catch {
                return Result.failure(.unableToOpen(error))
            }
        }
        return Result.failure(.fileNotFound(fileName))
    }
}

enum FileReadingError : Error{
    case fileNotFound(String)
    case unableToOpen(Error)
}
