//
//  StaticJSONMapper.swift
//  StudyGroupML
//
//  Created by Rakha Fatih Athallah on 05/02/24.
//

import Foundation

struct StaticJSONMapper {
    
    static func decode<T: Decodable>(file: String, type: T.Type) throws -> T {
        
        guard
              let path = Bundle.main.path(forResource: file, ofType: "json"),
              let data = FileManager.default.contents(atPath: path) else {
            throw MappingError.failedToGetContents
        }
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(T.self, from: data)
        return result
        
    }
}

extension StaticJSONMapper {
    enum MappingError: Error {
        case failedToGetContents
    }
}
