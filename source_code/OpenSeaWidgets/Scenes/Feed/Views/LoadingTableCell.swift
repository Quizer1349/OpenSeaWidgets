//
//  LoadingTableCell.swift
//  OpenSeaWidgets
//
//  Created by Oleksii Skliarenko on 03.07.2021.
//

import UIKit

class LoadingTableCell: UITableViewCell {
    // MARK: UI props
    private lazy var loadingIndicatorView: UIActivityIndicatorView = {
        let loadingIndicatorView = UIActivityIndicatorView(style: .medium)
        loadingIndicatorView.color = .white
        loadingIndicatorView.hidesWhenStopped = true
        return loadingIndicatorView
    }()
    
    // MARK: props
    private let padding = Configs.Layouts.charsListCellPadding
    
    // MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: UI Setup
    fileprivate func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        contentView.addSubview(loadingIndicatorView)

        loadingIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingIndicatorView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loadingIndicatorView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}

//MARK: - CellConfigurable
extension LoadingTableCell: CellConfigurable {
    typealias DataType = Bool
  
    func configure(data: Bool) {
        if data {
            loadingIndicatorView.startAnimating()
        } else {
            loadingIndicatorView.stopAnimating()
        }
    }
}
