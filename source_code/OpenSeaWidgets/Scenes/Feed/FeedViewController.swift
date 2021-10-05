//
//  CharactersViewController.swift
//  OpenSeaWidgets
//
//  Created by Oleksii Skliarenko on 02.07.2021.
//

import UIKit

class FeedViewController: BaseViewController {
    //MARK: - Props
    fileprivate let viewModel: AssetsListViewModel

    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        return tableView
    }()
    
    
    //MARK: - Lifecycle
    init() {
        viewModel = AssetsListViewModel()
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        viewModel = AssetsListViewModel()
        super.init(coder: coder)
        viewModel.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewDidLoad()
    }
    
    //MARK: - UI setup
    private func setupUI() {
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        title = NSLocalizedString("New", comment: "")
    }

    private func setupTableView() {
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
        
        tableView.registerCell(withClass: FeedTableCell.self)
        tableView.registerCell(withClass: LoadingTableCell.self)
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.rowHeight = Configs.Layouts.charsListCellHeight
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellConfigurator = viewModel.cellConfiguratorForIndexPath(indexPath: indexPath)

        guard let cell = tableView.dequeueReusableCell(withIdentifier: type(of: cellConfigurator).reuseId) else {
            return UITableViewCell()
        }
        
        if indexPath.row == viewModel.numberOfItems() - 1 && cellConfigurator is LoadingCellConfig == false {
            viewModel.loadNextPage()
        }
        
        cellConfigurator.configure(cell: cell)
        return cell
    }
}

// MARK: - HomeViewModelDelegate
extension FeedViewController: CharactersViewModelDelegate {
    func dataUpdated(error: Error?) {
        guard error == nil else { return }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
