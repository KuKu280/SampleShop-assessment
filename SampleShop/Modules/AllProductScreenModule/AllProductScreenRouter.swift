//
//  AllProductScreenRouter.swift
//  SampleShop
//
//  Created Ku Ku Zan on 19/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by Ku Ku Zan.
//

import UIKit
import Foundation

class AllProductScreenRouter: BaseRouter {
    
    // MARK: - Private properties
    private let storyboard = UIStoryboard(name: "AllProductScreen", bundle: nil)
    
    // MARK: Module Setup
    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: AllProductScreenViewController.self)
        super.init(viewController: moduleViewController)
        let interactor = AllProductScreenInteractor()
        let presenter = AllProductScreenPresenter(view: moduleViewController, interactor: interactor, router: self)
        moduleViewController.presenter = presenter
        interactor.presenter = presenter
    }
    
}

// MARK: - Presenter to Wireframe Interface
extension AllProductScreenRouter: AllProductScreenPresenterToRouterProtocol {
    
    func navigatToProductDetailScreen(_ product: Content) {
        self.navigationController?.pushView(ProductDetailScreenRouter(product))
    }
    
}
