//
//  CharacterListViewModel.swift
//  RickAndMortyZaraUIKit
//
//  Created by Lucas Romero Magaña on 16/4/24.
//

import Combine

class CharacterListViewModel {

    // MARK: - Properties
    private var dataFetcher: CharacterFetching
    private let state: CurrentValueSubject<CharacterListState, Never> = .init(.loading)
    private var cancellables: Set<AnyCancellable> = []
    private var charactersList: [CharacterListDecorator]?
    private var filteredCharactersList: [CharacterListDecorator]?
    private var isFiltering: Bool = false

    // MARK: - Object lifecycle
    init(dataFetcher: CharacterFetching) {
            self.dataFetcher = dataFetcher
    }

    // MARK: - Public Methods
    func getState() -> AnyPublisher<CharacterListState, Never> {
        return state.eraseToAnyPublisher()
    }

    func getCharacterList() -> [CharacterListDecorator] {

        if isFiltering {
            return filteredCharactersList ?? []
        }

        return charactersList ?? []
    }

    func loadData() {
            dataFetcher.getAllCharacters().sink(
                receiveCompletion: { [weak self] completion in
                    guard let self = self else { return }
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self.state.send(.failure(error))
                    }
                },
                receiveValue: { [weak self] characters in
                    self?.handlerCategories(characterItems: characters)
                }
            ).store(in: &cancellables)
        }

    func filterCharacterList(_ filteredText: String, isEmpty: Bool) {
        guard let charactersList = charactersList else { return }
        let filteredData = charactersList.filter { $0.characterName.lowercased().contains(filteredText.lowercased()) }
        if isEmpty {
            state.send(.success(charactersList))
        } else {
            state.send(.success(filteredData))
        }
        filteredCharactersList = filteredData
        isFiltering = !isEmpty
    }

    // MARK: - Private Methods
    private func handlerCategories(characterItems: [Character]) {
        let characterDecorators = characterItems.compactMap({CharacterListDecorator(
            characterName: $0.name,
            status: $0.status,
            image: $0.image,
            species: $0.species,
            type: $0.type == "" ? "-" : $0.type,
            gender: $0.gender,
            origin: $0.origin.name,
            location: $0.location.name) })
        self.charactersList = characterDecorators
        state.send(.success(characterDecorators))
    }
}

enum CharacterListState {
    case loading
    case success([CharacterListDecorator])
    case failure(BaseError)
}
