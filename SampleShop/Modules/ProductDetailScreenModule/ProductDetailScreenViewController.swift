//
//  ProductDetailScreenViewController.swift
//  SampleShop
//
//  Created Ku Ku Zan on 19/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by Ku Ku Zan.
//

import Foundation
import UIKit
import Kingfisher

class ProductDetailScreenViewController: UIViewController {
    
    // MARK: Delegate initialization
    var presenter: ProductDetailScreenViewToPresenterProtocol?
    
    // MARK: Outlets
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var addToCartView: UIView!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    @IBOutlet var customStepper: [UIButton]!
    @IBOutlet weak var customStepperCountLabel: UILabel!
    
    // MARK: Custom initializers go here
    
    var collectProducts: [Content] = [Content]()
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.started()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar(animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showNavigationBar(animated: animated)
    }
    
    // MARK: User Interaction - Actions & Targets
    @IBAction func backButtonAction(_ sender: UIButton) {
        presenter?.clickedBackButton()
    }
    
    @IBAction func addToCartButtonAction(_ sender: CustomButton) {
        debugPrint(collectProducts.count)
        presenter?.clickedAddToCartButton(collectProducts)
    }
    
    // MARK: Additional Helpers
    private func defaultSetup() {
        addToCartView.dropShadow()
    }
    
    @IBAction func stepperAction(_ sender: UIButton) {
        let control = StepperControl(rawValue: sender.tag) ?? .minus
        switch control {
        case .minus:
            guard collectProducts.count > 1 else {return }
            collectProducts.remove(at: collectProducts.count - 1)
        case .plus:
            guard let product = collectProducts.first else { return }
            collectProducts.append(product)
        }
        updateStepper()
    }
    
    private func updateStepper() {
        customStepperCountLabel.text = "\(collectProducts.count)"
    }
    
}

// MARK: - Extension
/**
 - Documentation for purpose of extension
 */
extension ProductDetailScreenViewController {
    
}

// MARK: - Presenter to View
extension ProductDetailScreenViewController: ProductDetailScreenPresenterToViewProtocl {
    
    func initialControlSetup() {
        defaultSetup()
    }
    
    func setProductData(_ product: Content) {
        productImageView.kf.setImage(with: URL(string: product.image))
        productNameLabel.text = product.name
        productDescriptionLabel.text = product.description
        productPriceLabel.text = "\(product.amount) MMK"
        collectProducts.append(product)
        updateStepper()
    }
    
}
