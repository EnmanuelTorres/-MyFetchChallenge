//
//  DataError.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 5/09/24.
//

import Foundation

enum DataError: Error {
    
    case URLError
    case networkError
    case apiError
    case decodingError
    case otherError(Error)
    case dataError
    case generic
    
}
