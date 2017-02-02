//
//  MGCell.swift
//  SwipeCells
//
//  Created by Vlad on 01/02/2017.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation
import UIKit
import MGSwipeTableCell

class MGCell: MGSwipeTableCell {
    let textView = ShowMoreTextView(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(textView)
        
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        
        // well... you can't get rid of boilerplate if you want make constraints programmatically
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.addConstraints(toSuperView: contentView, withPadding: 12)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
