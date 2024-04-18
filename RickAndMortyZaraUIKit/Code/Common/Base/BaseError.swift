//
//  BaseError.swift
//  RickAndMortyZaraUIKit
//
//  Created by Lucas Romero Magaña on 16/4/24.
//

import Foundation

enum BaseError: Error {
    case generic
    case noInternetConnection
    case APIresponse(ApiResponseError)
    case network(description: String)
}
