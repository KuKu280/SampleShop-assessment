//
//  OrderConfirmStatusViewController.swift
//  SampleShop
//
//  Created Ku Ku Zan on 19/04/2022.
//

import UIKit

protocol ConfirmPopupDelegate {
    func didPressButton()
}

class OrderConfirmStatusViewController: UIViewController {
    
    var delegate: ConfirmPopupDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func submitButtonAction(_ sender: CustomButton) {
        dismiss(animated: true) {
            self.delegate?.didPressButton()
        }
    }
    
}
