//
//  CharactersService.swift
//  OpenSeaWidgets
//
//  Created by Oleksii Skliarenko on 06.07.2021.
//

import Foundation

class AssetsService {
    static public func getAssetsList(page: Int, completion: @escaping (_ list: AssetsResponse?, _ error: NetworkError? ) -> Void) {
        APIClient.shared.router(AssetsAPI.self).request(.assets(page: page)) { (result: Result<AssetsResponse, NetworkError>) in
            switch result {
            case .success(let list):
                completion(list, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
