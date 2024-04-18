//
//  CharacterListDataManager.swift
//  RickAndMortyZaraUIKit
//
//  Created by Lucas Romero Magaña on 16/4/24.
//

import Combine
import Foundation
import Alamofire

class CharacterListDataManager: CharacterFetching {
    // MARK: - Properties
    private var apiClient: CharacterListApiClient

    // MARK: - Object lifecycle
    init(apiClient: CharacterListApiClient) {
        self.apiClient = apiClient
    }

    // MARK: - Public Method
    func getAllCharacters() -> AnyPublisher<[Character], BaseError> {
        return apiClient.getAllCharactersInit()
            .map { $0.results }
            .catch { error -> AnyPublisher<[Character], BaseError> in
                let baseError = BaseError.network(description: error.localizedDescription)
                return Fail(error: baseError).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }

    // MARK: - Private Method
    func getAllcgaractersInit() -> AnyPublisher<[Character], BaseError> {
        apiClient.getAllCharactersInit().map { characterDTO in
            characterDTO.results
        }
        .eraseToAnyPublisher()
    }
}
