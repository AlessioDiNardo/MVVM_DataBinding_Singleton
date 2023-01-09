//
//  ProductsCell.swift
//  MVVM_DataBinding_Singleton
//
//  Created by Alessio Di Nardo on 09/01/23.
//

import UIKit

class ProductsCell: UITableViewCell {

    @IBOutlet weak var productImageVew: UIImageView!
    @IBOutlet weak var productBackgroundView: UIView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    var product: Product? {
        didSet {
            productDetailConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productBackgroundView.clipsToBounds = false
        productBackgroundView.layer.cornerRadius = 15
        
        productImageVew.layer.cornerRadius = 10
        self.productBackgroundView.backgroundColor = .systemGray6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailConfiguration() {
        guard let product = product else { return }
        productTitleLabel.text = product.title
        productCategoryLabel.text = product.category
        descriptionLabel.text = product.description
        priceLabel.text = "$\(product.price)"
        rateButton.setTitle("\(product.rating.rate)", for: .normal)
        productImageVew.setImage(with: product.image)
    }
    
}
