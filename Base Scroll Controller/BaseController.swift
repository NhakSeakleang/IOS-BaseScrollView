//
//  ViewController.swift
//  Base Scroll Controller
//
//  Created by GIS on 12/30/19.
//  Copyright © 2019 GIS. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    
    private let baseView = BaseView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = baseView
        setUpNavigation()
    }
    
    private func setUpNavigation() {
        title = "Base Controller"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Derived", style: .done, target: self, action: #selector(OnDerived))
    }
    
    @objc private func OnDerived() {
        navigationController?.pushViewController(DerivedController(), animated: true)
    }

}

