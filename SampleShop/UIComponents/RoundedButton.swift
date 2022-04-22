//
//  RoundedButton.swift
//  SampleShop
//
//  Created Ku Ku Zan on 19/04/2022.
//

import Foundation
import UIKit

class RoundedButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }
    
    func setupUI() {
        self.layer.cornerRadius = self.frame.height / 2
    }
    
}
