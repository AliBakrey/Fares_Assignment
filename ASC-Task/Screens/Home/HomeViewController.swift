//
//  HomeViewController.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import CollectionViewPagingLayout
import Combine
import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var searchContinerView: UIView!
    @IBOutlet weak var searchTextField: UITextField!

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    var viewModel: HomeViewModelProtocol?
    /// Cancellable bag
    private var cancellables = [AnyCancellable]()
    private var offers: [HomeOffer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        bindVM()
        viewModel?.getOffers()
    }

    static func create(viewModel: HomeViewModelProtocol) -> HomeViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        vc.viewModel = viewModel
        return vc
    }

    @IBAction func sideMenuButton(_ sender: Any) {
        // TODO: - open side menu
    }
}

extension HomeViewController {
    private func setupUI() {
        searchContinerView.layer.cornerRadius = 20
        containerView.layer.cornerRadius = 25
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: PromotedTableViewCell.reuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: PromotedTableViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: PopularDestinationTableViewCell.reuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: PopularDestinationTableViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: CountryTableViewCell.reuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: CountryTableViewCell.reuseIdentifier)
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return offers.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch offers[section] {
        case .promotedOffers:
            return 1
        case .countries:
            return 1
        case let .countryOffer(offers: offers):
            return offers?.count ?? 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch offers[indexPath.section] {
        case let .promotedOffers(offers: offers):
            if let cell = tableView.dequeueReusableCell(withIdentifier: PromotedTableViewCell.reuseIdentifier, for: indexPath) as? PromotedTableViewCell {
                cell.setup(data: offers ?? [])
                return cell
            }
            return UITableViewCell()
        case let .countries(countries):
            if let cell = tableView.dequeueReusableCell(withIdentifier: PopularDestinationTableViewCell.reuseIdentifier, for: indexPath) as? PopularDestinationTableViewCell {
                cell.setup(data: countries ?? [])
                return cell
            }
            return UITableViewCell()
        case let .countryOffer(offers: offers):
            if let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.reuseIdentifier, for: indexPath) as? CountryTableViewCell {
                cell.setup(data: offers?[indexPath.row] )
                return cell
            }
            return UITableViewCell()
        }
    }
}

extension HomeViewController {
    func bindVM() {
        viewModel?.offers
            .receive(on: DispatchQueue.main)
            .sink { [weak self] offers in
                self?.offers = offers
                self?.tableView.reloadData()
            }.store(in: &cancellables)
    }
}
