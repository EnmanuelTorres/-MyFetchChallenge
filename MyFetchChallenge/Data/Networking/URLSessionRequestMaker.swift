//
//  URLSessionRequestMaker.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 6/09/24.
//

import Foundation


class URLSessionRequestMaker{
    
    func url(endpoint: String, baseUrl: String) -> URL? {
        let urlString = "\(baseUrl)\(endpoint)"
        return URL(string: urlString)
    }
}
