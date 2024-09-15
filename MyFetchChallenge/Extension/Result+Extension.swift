//
//  Result+Extension.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 4/09/24.
//

import Foundation

extension Result {
    var failureCase: Error? {
        switch self {
            
        case .success(_):
            return nil
        case .failure(let error):
            return error
        }
        
    }
    
}
