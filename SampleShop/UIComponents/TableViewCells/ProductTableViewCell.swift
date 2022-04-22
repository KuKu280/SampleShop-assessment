//
//  ProductTableViewCell.swift
//  SampleShop
//
//  Created Ku Ku Zan on 19/04/2022.
//

import UIKit
import Kingfisher

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productCodeLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(product: Content) {
        productCodeLabel.text = "\(product.id)"
        productNameLabel.text = product.name
        productPriceLabel.text = "\(product.amount) MMK"
        productImageView.kf.setImage(with: URL(string: product.image))
    }
    
}
