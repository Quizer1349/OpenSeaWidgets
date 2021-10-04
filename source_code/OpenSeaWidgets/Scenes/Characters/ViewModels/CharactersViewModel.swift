//
//  HomeViewModel.swift
//  RickMorty
//
//  Created by Oleksii Skliarenko on 02.07.2021.
//

import Foundation

protocol CharactersViewModelDelegate: AnyObject {
    func dataUpdated(error: Error?)
}

protocol CharactersViewModelInput {
    var delegate: CharactersViewModelDelegate? { get set }
    func viewDidLoad()
    func loadNextPage()
}

protocol CharactersViewModelOutput {
    func numberOfItems() -> Int
    func cellConfiguratorForIndexPath(indexPath: IndexPath) -> CellConfigurator
}

protocol CharactersViewModelProtocol: CharactersViewModelInput, CharactersViewModelOutput {}

typealias CaracterCellConfig = TableCellConfigurator<CharacterTableCell, AssetViewModel>
typealias LoadingCellConfig = TableCellConfigurator<LoadingTableCell, Bool>

class CharactersViewModel: CharactersViewModelProtocol {
    weak var delegate: CharactersViewModelDelegate?
    
    private var cellsItems: [CellConfigurator] = [CellConfigurator]()
    private var assetsList: AssetsResponse?
    
    // MARK: CharactersViewModelProtocol
    func viewDidLoad() {
        cellsItems = [LoadingCellConfig(item: true)]
        delegate?.dataUpdated(error: nil)
        fetchCharacters(page: 1)
    }
    
    func loadNextPage() {
//        guard let page = charactersList?.info.nextPageNumber else { return }
//        cellsItems.append(LoadingCellConfig(item: true))
//        delegate?.dataUpdated(error: nil)
//        fetchCharacters(page: page)
    }
    
    func numberOfItems() -> Int {
        return cellsItems.count
    }
    
    func cellConfiguratorForIndexPath(indexPath: IndexPath) -> CellConfigurator {
        return cellsItems[indexPath.row]
    }
    
    // MARK: Helpers
    private func fetchCharacters(page: Int) {
        API.assets.getAssetsList(page: page) { [weak self] list, error in
            if let list = list {
                self?.mapCharactersListToCaracterCellConfig(list)
                self?.assetsList = list
            }
            self?.delegate?.dataUpdated(error: error)
        }
    }
    
    private func mapCharactersListToCaracterCellConfig(_ assetsList: AssetsResponse) {
        let viewModels = assetsList.assets.compactMap{ AssetViewModel(asset: $0) }
        let cellConfigurators = viewModels.compactMap{ CaracterCellConfig(item: $0) }
        if let _ = self.assetsList {
            if cellsItems.last is LoadingCellConfig {
                cellsItems.removeLast()
            }
            cellsItems.append(contentsOf: cellConfigurators)
        } else {
            cellsItems = cellConfigurators
        }
    }
}
