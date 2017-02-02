//
//  Cell.swift
//  SwipeCells
//
//  Created by Vlad on 31/01/2017.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation
import UIKit

class Cell: UITableViewCell {
    let textView = ShowMoreTextView(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(textView)
        
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        
        // well... you can't get rid of boilerplate if you want make constraints programmatically
        textView.translatesAutoresizingMaskIntoConstraints = false
        for dir in [NSLayoutAttribute.bottom,NSLayoutAttribute.trailing] {
            self.addConstraint(NSLayoutConstraint(item: self, attribute: dir, relatedBy: .equal,
                                                  toItem: self.textView, attribute: dir, multiplier: 1, constant: 12))
        }
        
        for dir in [NSLayoutAttribute.leading, NSLayoutAttribute.top] {
            self.addConstraint(NSLayoutConstraint(item: self.textView, attribute: dir, relatedBy: .equal,
                                                  toItem: self, attribute: dir, multiplier: 1, constant: 12))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
