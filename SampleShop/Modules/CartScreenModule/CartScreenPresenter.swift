//
//  CartScreenPresenter.swift
//  SampleShop
//
//  Created Ku Ku Zan on 19/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by Ku Ku Zan.
//

import Foundation
import UIKit

class CartScreenPresenter {
    
    // MARK: - Private properties
    private unowned var view: CartScreenPresenterToViewProtocl
    private var interactor: CartScreenPresentorToInterectorProtocol
    private var router: CartScreenPresenterToRouterProtocol
    
    // MARK: - Lifecycle
    init(view: CartScreenPresenterToViewProtocl, interactor: CartScreenPresentorToInterectorProtocol, router: CartScreenPresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

// MARK: - View to Presenter
extension CartScreenPresenter: CartScreenViewToPresenterProtocol {
    
    func started() {
        view.initialControlSetup()
        view.products = interactor.products
    }
    
    func clickedCheckOutButtton() {
        router.showConfirmPopup()
    }
    
}

// MARK: - Interactor to Presenter
extension CartScreenPresenter: CartScreenInterectorToPresenterProtocol {
    
}

