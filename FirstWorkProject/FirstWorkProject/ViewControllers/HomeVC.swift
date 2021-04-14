//
//  ViewController.swift
//  FirstWorkProject
//
//  Created by Satsishur on 12.04.2021.
//

import UIKit

class HomeVC: UIViewController {
    //MARK: Views
    internal var searchController = UISearchController(searchResultsController: nil)
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchResponceTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 100
        return tableView
    }()
    //MARK: Properties
    internal var dataSource: [iTunes_Result]  = []
    private let networkService = NetworkService()
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupSearchBar()
    }
    //MARK: Setup Layout
    private func setupLayout() {
        setupSubviews()
        setupTableView()
    }
    
    private func setupSubviews() {
        view.addSubview(searchController.searchBar)
        view.addSubview(tableView)
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
    
    private func setupSearchBar() {
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Start searching"
    }
}
//MARK: SearchBarDelegate
extension HomeVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchBar = searchController.searchBar
        guard let searchTerm = searchBar.text else {return}
        searchITunes(searchTerm: searchTerm)
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
                    if !(result.kind == nil || result.artistName == nil || result.trackName == nil) { //check for insufficient data
                        self.dataSource.append(result)
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(.unknown(let error)):
                print("unknown error", error)
            case .failure(.emptyData):
                print("no data")
            case .failure(.parsingData(let error)):
                print("json error", error)
            }
        }
    }
}





