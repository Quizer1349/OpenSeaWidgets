//
//  CharacterViewModel.swift
//  OpenSeaWidgets
//
//  Created by Oleksii Skliarenko on 02.07.2021.
//

import UIKit

struct AssetViewModel {
    // MARK: Props
    let name: String
    let imageURL: URL?
    
    // MARK: Init
    init(asset: Asset) {
        name = asset.name ?? ""
        imageURL = URL(string: asset.imagePreviewURL ?? asset.imageThumbnailURL ?? asset.animationURL ?? asset.imageURL)
    }
    
    // MARK: Helpers
}
