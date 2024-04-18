//
//  BaseErrorExtensions.swift
//  RickAndMortyZaraUIKit
//
//  Created by Lucas Romero Magaña on 18/4/24.
//

import Foundation

extension BaseError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .network(let description):
            return description
        default:
            return "An unknown error occurred."
        }
    }
}
