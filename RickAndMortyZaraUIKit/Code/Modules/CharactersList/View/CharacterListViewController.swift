//
//  ViewController.swift
//  RickAndMortyZaraUIKit
//
//  Created by Lucas Romero Magaña on 16/4/24.
//

import UIKit
import Combine

class CharacterListViewController: BaseViewController {

    // MARK: - Properties

    private enum Constants {
        static var searchBarPlaceholder = "Type something"
        static var heighForRow = 120.0
    }

    private var viewModel: CharacterListViewModel?
    private var dataSource = CharactersListDataSource()
    var navigator: CharacterNavigationProtocol?
    var cancellables: Set<AnyCancellable> = []

    @IBOutlet weak var tvCharacters: UITableView!
    @IBOutlet weak var sbCharacters: UISearchBar!

    // MARK: - Object lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        configTableView()
        responseViewModel()
        viewModel?.loadData()
    }

    deinit {
        cancellables.forEach { $0.cancel() }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sbCharacters.searchTextField.attributedPlaceholder = NSAttributedString(string: Constants.searchBarPlaceholder)
    }

    // MARK: Public Methods
    func set(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Private metohds
    private func configView() {
        tvCharacters.delegate = self
        sbCharacters.delegate = self
        tvCharacters.register(
            UINib(
                nibName: CharacterListCell.nibName,
                bundle: nil
            ),
            forCellReuseIdentifier: CharacterListCell.identifier
        )
        self.hideKeyboardWhenTappedAround()
    }

    private func responseViewModel() {
        viewModel?.getState().sink(receiveValue: { [weak self] catalogState in
            guard let self = self else { return }
            switch catalogState {
            case .loading:
                self.showLoading()
            case .success(let categoryList):
                self.reloadTableView(categoryList: categoryList)
                self.hideLoading()
            case .failure(let error):
                self.showError(error)
            }
        }).store(in: &cancellables)
    }
    private func configTableView() {
        tvCharacters.dataSource = dataSource
        tvCharacters.separatorStyle = .singleLine
        tvCharacters.separatorInset = UIEdgeInsets.zero
    }

    private func reloadTableView(categoryList: [CharacterListDecorator]) {
        dataSource.update(with: categoryList)
        tvCharacters.reloadData()
    }

    private func showError(_ error: BaseError) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}

extension CharacterListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            if let character = viewModel?.getCharacterList()[indexPath.row] {
                navigator?.navigateToCharacterDetails(with: character, from: self)
            }
        }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.heighForRow
    }
}

extension CharacterListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            viewModel?.filterCharacterList(searchText, isEmpty: true)
        } else {
            viewModel?.filterCharacterList(searchText, isEmpty: false)
        }
    }
}
