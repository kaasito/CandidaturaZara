//
//  CharacterListApiClient.swift
//  RickAndMortyZaraUIKit
//
//  Created by Lucas Romero Magaña on 16/4/24.
//

import Foundation
import Alamofire
import Combine

class CharacterListApiClient: BaseAPIClient {
    func getAllCharactersInit() -> AnyPublisher<CharacterListDto, BaseError> {
        requestPublisher(
            relativePath: Endpoints.authorize,
            method: .get,
            parameters: nil,
            urlEncoding: JSONEncoding.default
        )
        .mapError { error -> BaseError in
            return .network(description: error.localizedDescription)
        }
        .eraseToAnyPublisher()
    }
}
