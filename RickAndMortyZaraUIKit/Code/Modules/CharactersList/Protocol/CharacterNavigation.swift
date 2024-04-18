//
//  CharacterNavigation.swift
//  RickAndMortyZaraUIKit
//
//  Created by Lucas Romero Magaña on 16/4/24.
//

import Foundation
import UIKit

protocol CharacterNavigationProtocol {
    func navigateToCharacterDetails(with character: CharacterListDecorator, from viewController: UIViewController)
}
