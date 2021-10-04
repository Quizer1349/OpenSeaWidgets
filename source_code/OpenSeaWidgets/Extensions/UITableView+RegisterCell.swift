//
//  UITableView+RegisterCell.swift
//  RickMorty
//
//  Created by Oleksii Skliarenko on 02.07.2021.
//

import UIKit

extension UITableView {
    func registerCell<T:UITableViewCell>(withClass cellClass: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.classNameToString)
    }
    
    func registerCellNib<T: UITableViewCell>(withClass cellClass: T.Type) {
        let Nib = UINib(nibName: T.classNameToString, bundle: nil)
        register(Nib, forCellReuseIdentifier: T.classNameToString)
    }
}
