//
//  PopularDestinationCollectionViewCell.swift
//  ASC-Task
//
//  Created by fares on 22/01/2022.
//

import UIKit

class PopularDestinationCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    static let reuseIdentifier = "PopularDestinationCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        countryImage.cornerRadius = 12
        countryImage.clipsToBounds = true
    }
}
