//
//  HTTPClient.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 6/09/24.
//

import Foundation

protocol HTTPClient {
    func makeRequest(endpoint: String, baseUrl: String) async -> Result<Data, DataError>
}
