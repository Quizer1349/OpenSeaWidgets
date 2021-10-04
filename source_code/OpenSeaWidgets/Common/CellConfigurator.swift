//
//  CellConfigurator.swift
//  RickMorty
//
//  Created by Oleksii Skliarenko on 02.07.2021.
//

import UIKit

protocol CellConfigurator {
    static var reuseId: String { get }
    func configure(cell: UIView)
}

protocol CellConfigurable {
    associatedtype DataType
    func configure(data: DataType)
}


class TableCellConfigurator<CellType: CellConfigurable, DataType>: CellConfigurator where CellType.DataType == DataType, CellType: UITableViewCell {
    
    static var reuseId: String { return CellType.classNameToString }
    
    let item: DataType
    
    init(item: DataType) {
        self.item = item
    }
    
    func configure(cell: UIView) {
        (cell as? CellType)?.configure(data: item)
    }
}
