//
//  CharacterDetailViewModel.swift
//  RickAndMortyZaraUIKit
//
//  Created by Lucas Romero Magaña on 16/4/24.
//

import Foundation

class CharacterDetailViewModel {

    // MARK: - Properties
    private var characterListDecorator: CharacterListDecorator

    // MARK: - Object lifecycle
    init(characterListDecorator: CharacterListDecorator) {
        self.characterListDecorator = characterListDecorator
    }

    // MARK: - Private Methods
    func getCharacterDecorator() -> CharacterListDecorator {
        characterListDecorator
    }
}
