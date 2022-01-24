//
//  CountryTableViewCell.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var collectionView: UICollectionView!

    static let reuseIdentifier = "CountryTableViewCell"
    var offers: [PromotedOffer] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setupUI()
    }
}

extension CountryTableViewCell {
    private func setupUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: CountryCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CountryCollectionViewCell.reuseIdentifier)
    }

    func setup(data: CountryOfferSection?) {
        offers = data?.offers ?? []
        titleLabel.text = data?.name
        collectionView.reloadData()
    }
}

extension CountryTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CountryCollectionViewCell.reuseIdentifier, for: indexPath) as? CountryCollectionViewCell {
            let offer = offers[indexPath.item]
            cell.titleLabel.text = offer.title
            cell.subtitleLabel.text = offer.destination
            cell.daysLabel.text = offer.duration
            cell.imageView.setImageWith(urlString: offer.image)
            cell.priceLabel.text = "\(offer.price ?? 0) \(offer.currency ?? "KWD")"
            cell.likeCount.text = (offer.favouriteCount ?? 0) == 0 ? "" : "\(offer.favouriteCount ?? 0)"
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offers.count
    }
}

extension CountryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height
        let width = (collectionView.frame.size.width / 2) - 20
        return CGSize(width: width, height: height)
    }
}
