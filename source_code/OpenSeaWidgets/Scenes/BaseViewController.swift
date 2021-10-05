//
//  BaseViewController.swift
//  OpenSeaWidgets
//
//  Created by Oleksii Skliarenko on 05.10.2021.
//

import UIKit

class BaseViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  fileprivate func setupUI(){
    view.backgroundColor = .white
  }
}
