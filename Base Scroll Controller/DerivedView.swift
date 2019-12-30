//
//  DerivedView.swift
//  Base Scroll Controller
//
//  Created by GIS on 12/30/19.
//  Copyright © 2019 GIS. All rights reserved.
//

import Foundation
import UIKit

class DerivedView: BaseView {
    
    private let tfUsername: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter username"
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.gray.cgColor
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        containerView.addSubview(tfUsername)
        tfUsername.translatesAutoresizingMaskIntoConstraints = false
        tfUsername.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        tfUsername.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        tfUsername.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
        tfUsername.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
