//
//  UIViewController+Utils.swift
//  WhiteLabelDemo
//
//  Created by Pivulski, Nikolai on 26.05.21.
//

import UIKit

extension UIViewController {

    func add(_ child: UIViewController, to containerView: UIView) {
        addChild(child)
        containerView.addFillSubview(child.view)
        child.didMove(toParent: self)
    }

}

extension UIView {

    func addFillSubview(_ subview: UIView) {
        self.addSubview(subview)

        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        subview.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        subview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

}
