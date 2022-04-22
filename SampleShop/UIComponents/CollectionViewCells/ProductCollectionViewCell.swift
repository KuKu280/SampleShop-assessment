//
//  ProductCollectionViewCell.swift
//  SampleShop
//
//  Created Ku Ku Zan on 19/04/2022.
//

import UIKit
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        addToCartButton.layer.cornerRadius = addToCartButton.frame.width / 2
    }
    
    func configCell(product: Content) {
        productNameLabel.text = product.name
        productPriceLabel.text = "\(product.amount) MMK"
        productImageView.kf.setImage(with: URL(string: product.image))
    }
    
}
