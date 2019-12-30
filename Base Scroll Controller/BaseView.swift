//
//  BaseView.swift
//  Base Scroll Controller
//
//  Created by GIS on 12/30/19.
//  Copyright © 2019 GIS. All rights reserved.
//

import Foundation
import UIKit

class BaseView: UIView {
    
    private let scrollView: UIScrollView = {
        let scrollV = UIScrollView()
        scrollV.showsVerticalScrollIndicator = true
        scrollV.showsHorizontalScrollIndicator = false
        scrollV.alwaysBounceVertical = true
        scrollV.alwaysBounceHorizontal = false
        return scrollV
    }()
    
    let containerView: UIView = {
        let v = UIView()
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpEvent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        checkScrollable()
    }
    
    private func setUpEvent() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func dismissKeyboard() {
        endEditing(true)
    }
    
    @objc func handleKeyboard(notification: Notification) {
        
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = convert(keyboardScreenEndFrame, from: window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = .zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - safeAreaInsets.bottom, right: 0)
        }
        
        scrollView.scrollIndicatorInsets = scrollView.contentInset
        checkScrollable()
    }
    
    func checkScrollable() {
        containerView.layoutIfNeeded()
        scrollView.layoutIfNeeded()
        if containerView.frame.height <= scrollView.frame.height - scrollView.contentInset.bottom {
            scrollView.isScrollEnabled = false
        } else {
            scrollView.isScrollEnabled = true
        }
    }
    
    private func setUpView() {
        backgroundColor = .white
        
        // scrollview
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        // container
        scrollView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        // remove this height when use, it's just for testing
        containerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 1).isActive = true
    }
    
}
