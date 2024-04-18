//
//  CharactersListDataSource.swift
//  RickAndMortyZaraUIKit
//
//  Created by Lucas Romero Magaña on 16/4/24.
//

import UIKit

class CharactersListDataSource: NSObject, UITableViewDataSource {
    var characters: [CharacterListDecorator] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CharacterListCell.identifier,
            for: indexPath) as? CharacterListCell else {
            return UITableViewCell()
        }
        cell.config(characterElement: characters[indexPath.row])
        return cell
    }

    func update(with characters: [CharacterListDecorator]) {
        self.characters = characters
    }
}
