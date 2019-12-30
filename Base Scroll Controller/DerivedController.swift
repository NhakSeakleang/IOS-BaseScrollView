//
//  DerivedController.swift
//  Base Scroll Controller
//
//  Created by GIS on 12/30/19.
//  Copyright © 2019 GIS. All rights reserved.
//

import UIKit

class DerivedController: UIViewController {
    
    private let derivedView = DerivedView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view = derivedView
    }

}
