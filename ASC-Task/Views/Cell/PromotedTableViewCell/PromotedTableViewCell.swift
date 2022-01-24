//
//  PromotedTableViewCell.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import CollectionViewPagingLayout
import UIKit

class PromotedTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLabelView: UIView!

    // MARK: Properties

    let layout = CollectionViewPagingLayout()
    static let reuseIdentifier = "PromotedTableViewCell"
    var offers: [PromotedOffer] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        configureCollectionView()
        reloadAndInvalidateShapes()
        reloadDataAndLayouts()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        reloadAndInvalidateShapes()
        titleLabelView.layer.cornerRadius = titleLabelView.frame.size.height / 2
    }

    func setup(data: [PromotedOffer]) {
        offers = data
        reloadAndInvalidateShapes()
        layout.setCurrentPage(offers.count, animated: false)
    }

    func reloadAndInvalidateShapes() {
        collectionView?.reloadData()
        invalidateCollectionViewLayout()
    }

    private func configureCollectionView() {
        collectionView.register(UINib(nibName: PromotedCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: PromotedCollectionViewCell.reuseIdentifier)
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        layout.numberOfVisibleItems = 3
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.clipsToBounds = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
    }

    private func reloadDataAndLayouts() {
        collectionView?.reloadData()
        invalidateCollectionViewLayout()
    }

    private func invalidateCollectionViewLayout() {
        collectionView?.performBatchUpdates({ [weak self] in
            self?.collectionView?.collectionViewLayout.invalidateLayout()
        })
    }
}

extension PromotedTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotedCollectionViewCell.reuseIdentifier, for: indexPath) as? PromotedCollectionViewCell {
            let offer = offers[indexPath.item]
            cell.titlelabel.text = offer.title
            cell.subTitleLabel.text = offer.destination
            cell.numberOfDayes.text = offer.duration
            cell.offerImage.setImageWith(urlString: offer.image)
            cell.priceLabel.text = "\(offer.price ?? 0) \(offer.currency ?? "KWD")"
            return cell
        }

        return UICollectionViewCell()
    }
}

extension PromotedTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        (collectionView.collectionViewLayout as? CollectionViewPagingLayout)?.setCurrentPage(indexPath.row) { [weak self] in
            DispatchQueue.main.async {
                self?.reloadAndInvalidateShapes()
            }
        }
    }
}
