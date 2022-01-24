//
//  PopularDestinationTableViewCell.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import UIKit

class PopularDestinationTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    static let reuseIdentifier = "PopularDestinationTableViewCell"
    var countries: [PopularCountryList] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setupUI()
    }
}

extension PopularDestinationTableViewCell {
    private func setupUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: PopularDestinationCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: PopularDestinationCollectionViewCell.reuseIdentifier)
    }

    func setup(data: [PopularCountryList]) {
        countries = data
        collectionView.reloadData()
    }
}

extension PopularDestinationTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularDestinationCollectionViewCell.reuseIdentifier, for: indexPath) as? PopularDestinationCollectionViewCell {
            cell.titleLabel.text = countries[indexPath.item].nameEn
            cell.countryImage.setImageWith(urlString: countries[indexPath.item].image)
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
}

extension PopularDestinationTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height
        let width = (collectionView.frame.size.width / 4 - 30)
        return CGSize(width: width, height: height)
    }
}
