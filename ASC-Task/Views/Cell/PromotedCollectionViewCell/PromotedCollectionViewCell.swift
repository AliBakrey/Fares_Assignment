//
//  PromotedCollectionViewCell.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import CollectionViewPagingLayout
import UIKit

class PromotedCollectionViewCell: UICollectionViewCell, StackTransformView {
    @IBOutlet weak var continerView: UIView!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var numberOfDayes: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var offerImage: UIImageView!
    
    var stackOptions: StackTransformViewOptions {
        .layout(.reverse)
    }

    var cardView: UIView {
        return continerView
    }
    
    static let reuseIdentifier = "PromotedCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}

extension PromotedCollectionViewCell {
    private func setupUI() {
        continerView.cornerRadius = 15
        continerView.clipsToBounds = true
    }
}
