//
//  BaseExtension.swift
//  SampleShop
//
//  Created Ku Ku Zan on 19/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by Ku Ku Zan.
//

import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T: UIViewController>(ofType _: T.Type, withIdentifier identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        return instantiateViewController(withIdentifier: identifier) as! T
    }
    
}

extension UITextField {
    
    var inputValue: String {
        return self.text ?? ""
    }
}

extension UIViewController {
    
    func hideNavigationBar(animated: Bool){
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

    }

    func showNavigationBar(animated: Bool) {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
