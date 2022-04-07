//
//  EarthquakeViewController.swift
//  eBayQuake
//
//  Created by Federico Dominguez on 05/04/2022.
//

import UIKit

final class EarthquakesViewController: UITableViewController {
    
    private(set) lazy var activityIndicatorView = UIActivityIndicatorView(style: .medium)
    
    private let viewModel: EarthquakesViewModel!
    
    init(viewModel: EarthquakesViewModel = EarthquakesViewModel()) {
        self.viewModel = viewModel
        super.init(style: .plain)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(EarthquakeCell.self, forCellReuseIdentifier: EarthquakeCellViewModel.reuseIdentifier)
        configureViewController()
        configureRefreshControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureActivityIndicatorView()
        viewModel.fetchEarthquakes()
    }
    
    @objc func handleRefresh() {
        viewModel.fetchEarthquakes()
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
}

// MARK: - EarthquakesViewModelDelegate
extension EarthquakesViewController: EarthquakesViewModelDelegate {
    
    func didFinishLoading() {
        DispatchQueue.main.async { self.activityIndicatorView.stopAnimating() }
    }
    
    func didFinishFetching() {
        DispatchQueue.main.async { self.tableView.reloadData() }
    }
    
    func didFinishWithError() {
        presentAlertOnMainThread(title: "Ooops!", message: viewModel.errorMessage, buttonTitle: "OK")
    }
    
}

// MARK: - UITableViewDataSource
extension EarthquakesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EarthquakeCellViewModel.reuseIdentifier, for: indexPath) as! EarthquakeCell
        let earthquake = viewModel.cellForRowAt(indexPath: indexPath)
        cell.populateCell(with: EarthquakeCellViewModel(earthquake: earthquake))
        return cell
    }
}

// MARK: - UITableViewDelegate
extension EarthquakesViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewModel = EarthquakeLocationViewModel(earthquake: viewModel.cellForRowAt(indexPath: indexPath))
        let destinationViewController = EarthquakeLocationViewController(earthquakeViewModel: viewModel)
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    
}

// MARK: - ConfigureUI
extension EarthquakesViewController {
    
    func configureRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(handleRefresh), for: UIControl.Event.valueChanged)
    }
    
    func configureActivityIndicatorView() {
        tableView.addSubview(activityIndicatorView)
        
        activityIndicatorView.startAnimating()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicatorView.topAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.topAnchor, constant: 150),
            activityIndicatorView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
        ])
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Earthquakes"
    }
}


