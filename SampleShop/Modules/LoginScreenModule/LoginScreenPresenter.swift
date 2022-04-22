//
//  LoginScreenPresenter.swift
//  SampleShop

//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//  This file was generated by Ku Ku Zan.
//

import Foundation
import UIKit

class LoginScreenPresenter {
    
    // MARK: - Private properties
    private unowned var view: LoginScreenPresenterToViewProtocl
    private var interactor: LoginScreenPresentorToInterectorProtocol
    private var router: LoginScreenPresenterToRouterProtocol
    
    // MARK: - Lifecycle
    init(view: LoginScreenPresenterToViewProtocl, interactor: LoginScreenPresentorToInterectorProtocol, router: LoginScreenPresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

// MARK: - View to Presenter
extension LoginScreenPresenter: LoginScreenViewToPresenterProtocol {
    
    func started() {
        view.initialControlSetup()
    }
    
    func clickedLoginButton(inputData: LoginRequestModel) {
        guard interactor.validation(inputData) else { return }
        interactor.loginAPICall(inputData: inputData)
    }
    
}

// MARK: - Interactor to Presenter
extension LoginScreenPresenter: LoginScreenInterectorToPresenterProtocol {
    
    func fetchingStart() {
        view.showLoading()
    }
    
    func success() {
        view.hideLoading()
        router.navigateToProductScreen()
    }
    
    func fail(error: Error) {
        view.hideLoading()
        debugPrint(error)
        if let error = error as? APIError {
            router.showAlert(with: "Error!", message: error.rawValue)
            return
        }
        router.showAlert(with: "Error!", message: error.localizedDescription)
    }
    
    func validationFail(_ errorMessage: ValidationErrors) {
        view.showTextFieldErrorLabel(error: errorMessage)
    }
    
}

