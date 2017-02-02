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
