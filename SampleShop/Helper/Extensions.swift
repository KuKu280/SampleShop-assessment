//
//  Extensions.swift
//  SampleShop
//
//  Created Ku Ku Zan on 19/04/2022.
//

import Foundation
import UIKit

extension UITextField  {
    
    func addVisibleButton() {
        let button = UIButton(frame: CGRect(x: 10, y: 10, width: 25, height: 25))
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.setImage(UIImage(systemName: "eye.fill"), for: .selected)
        let container: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
        container.addSubview(button)
        rightView = container
        rightViewMode = .always
        self.tintColor = .appColor(.secondaryTextColor)
        button.addTarget(self, action: #selector(visibleBtnAction(_:)), for: .touchUpInside)
    }
    
    @objc private func visibleBtnAction(_ sender: UIButton) {
        self.isSecureTextEntry = sender.isSelected
        sender.isSelected = !sender.isSelected
    }
    
}

extension UIColor {
    
    static func appColor(_ name: AssetsColor) -> UIColor? {
        return UIColor(named: name.rawValue)
    }
    
}

extension UISearchBar {
    
    func searchBarStyle() {
        self.searchTextField.backgroundColor = .appColor(.searchbarBGColor)
        self.searchTextField.textColor = .lightGray
        self.tintColor = .lightGray
        self.searchTextField.borderStyle = .none
        self.searchTextField.layer.cornerRadius = 2
        self.searchTextField.layer.masksToBounds = true
        self.searchTextField.leftView?.tintColor = .lightGray
        self.placeholder = "Search"
    }
    
}

extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

extension UITableView {
    
    func registerCell(type: UITableViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
    }
    
    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier) as? T
    }
    
    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as? T
    }
    
}

extension UICollectionReusableView {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

extension UICollectionView {
    
    func registerCell(type: UICollectionViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: identifier ?? cellId)
    }
    
    func dequeueCell<T: UICollectionViewCell>(withType type: UICollectionViewCell.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as? T
    }
    
}

extension UICollectionViewLayout {
    
    static var productLayout: UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 25, height: UIScreen.main.bounds.width / 1.9)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = .zero
        return layout
    }
    
}

extension UIView {
    
    func dropShadow() {
        self.layer.masksToBounds =  false
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
    }
    
}
