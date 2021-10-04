//
//  CharactersViewController.swift
//  RickMorty
//
//  Created by Oleksii Skliarenko on 02.07.2021.
//

import UIKit

class CharactersViewController: UIViewController {
    //MARK: - Props
    fileprivate let viewModel: CharactersViewModel

    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        return tableView
    }()
    
    
    //MARK: - Lifecycle
    init() {
        viewModel = CharactersViewModel()
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        viewModel = CharactersViewModel()
        super.init(coder: coder)
        viewModel.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.setGradientBackground(topColor: Configs.Colors.pink, bottomColor: Configs.Colors.blue)
    }
    
    //MARK: - UI setup
    private func setupUI() {
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        title = NSLocalizedString("Characters", comment: "")
    }

    private func setupTableView() {
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
        
        tableView.registerCell(withClass: CharacterTableCell.self)
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
extension CharactersViewController: UITableViewDataSource, UITableViewDelegate {
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
extension CharactersViewController: CharactersViewModelDelegate {
    func dataUpdated(error: Error?) {
        guard error == nil else { return }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
