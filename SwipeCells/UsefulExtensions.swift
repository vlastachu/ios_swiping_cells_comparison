//
//  UsefulExtensions.swift
//  SwipeCells
//
//  Created by Vlad on 01/02/2017.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func addOnTapFn1<A, B>(callback: (A) -> B) {
        addTarget(callback, action: Selector("invoke"), for: .touchUpInside)
    }
    
    
    func addOnTap(callback: () -> ()) {
        addTarget(callback, action: Selector("invoke"), for: .touchUpInside)
    }
}

extension UIView {
    func addConstraints(toSuperView superview: UIView, withPadding padding: CGFloat) {
        // well... you can't get rid of boilerplate if you want make constraints programmatically
        for dir in [NSLayoutAttribute.bottom,NSLayoutAttribute.trailing] {
            superview.addConstraint(NSLayoutConstraint(item: superview, attribute: dir, relatedBy: .equal,
                                                         toItem: self, attribute: dir, multiplier: 1, constant: padding))
        }
        
        for dir in [NSLayoutAttribute.leading, NSLayoutAttribute.top] {
            superview.addConstraint(NSLayoutConstraint(item: self, attribute: dir, relatedBy: .equal,
                                                         toItem: superview, attribute: dir, multiplier: 1, constant: padding))
        }
    }
}
