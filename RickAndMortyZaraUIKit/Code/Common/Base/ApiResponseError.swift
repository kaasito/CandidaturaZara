//
//  ApiResponseError.swift
//  RickAndMortyZaraUIKit
//
//  Created by Lucas Romero Magaña on 16/4/24.
//

import Foundation

struct ApiResponseError: Codable {
    let errors: [ErrorResponseDTO]
}

struct ErrorResponseDTO: Codable {
    let code: String
    let level: String
    let message: String
    let description: String
}
