//
//  CharacterFetching.swift
//  RickAndMortyZaraUIKit
//
//  Created by Lucas Romero Magaña on 16/4/24.
//

import Foundation
import Combine

protocol CharacterFetching {
    func getAllCharacters() -> AnyPublisher<[Character], BaseError>
}
