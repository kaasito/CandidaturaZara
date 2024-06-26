//
//  CharacterListDecorator.swift
//  RickAndMortyZaraUIKit
//
//  Created by Lucas Romero Magaña on 16/4/24.
//

import Foundation

struct CharacterListDecorator: Hashable {
    let characterName: String
    let status: String
    let image: String
    let species: String
    let type: String
    let gender: String
    let origin, location: String
}
