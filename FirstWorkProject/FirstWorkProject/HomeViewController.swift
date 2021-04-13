//
//  ViewController.swift
//  FirstWorkProject
//
//  Created by Satsishur on 12.04.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var searchController = UISearchController(searchResultsController: nil)
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchResponceTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 100
        return tableView
    }()
    
    private var dataSource: [iTunes_Result]  = []
    private let networkService = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupSearchBar()
    }

    private func setupLayout() {
        setupSubviews()
        setupTableView()
    }
    
    private func setupSubviews() {
        view.addSubview(searchController.searchBar)
        view.addSubview(tableView)
    }
    
    private func setupSearchBar() {
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Start searching"
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    private func searchITunes(searchTerm: String) {
        networkService.getResults(searchTerm: searchTerm) { (result) in
            switch result {
            case .success(let responce):
                if !self.dataSource.isEmpty {
                    self.dataSource = []
                }
                let results = responce.results
                for result in results {
                    if !(result.kind == nil || result.artistName == nil || result.trackName == nil) {
                        self.dataSource.append(result)
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchResponceTableViewCell
        let model = dataSource[indexPath.row]
        cell.configure(model: model)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailVC()
        present(vc, animated: true)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchBar = searchController.searchBar
        guard let searchTerm = searchBar.text else {return}
        searchITunes(searchTerm: searchTerm)
    }
}

