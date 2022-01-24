//
//  CountryCollectionViewCell.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import UIKit

class CountryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    @IBOutlet weak var likeCount: UILabel!
    static let reuseIdentifier = "CountryCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.cornerRadius = 12
        containerView.cornerRadius = 12
        mainView.shadowRadius = 1
        mainView.shadowOpacity = 0.5
        mainView.shadowOffsetX = 1
        mainView.shadowOffsetY = 1
        mainView.shadow_Color = UIColor.black.withAlphaComponent(0.5)
        
    }
}
