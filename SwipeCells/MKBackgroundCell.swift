//
//  MKBackgroundCell.swift
//  SwipeCells
//
//  Created by Vlad on 02/02/2017.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation
import UIKit

class MKBackgroundCell: UITableViewCell {
    let delete = UIButton(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(delete)
        
        delete.setTitle("Remove", for: .normal)
        delete.setImage(UIImage(named: "remove"), for: .normal)
        delete.backgroundColor = UIColor.red
        
        // well... you can't get rid of boilerplate if you want make constraints programmatically
        delete.translatesAutoresizingMaskIntoConstraints = false
        for dir in [NSLayoutAttribute.bottom,NSLayoutAttribute.trailing] {
            contentView.addConstraint(NSLayoutConstraint(item: contentView, attribute: dir, relatedBy: .equal,
                                                         toItem: delete, attribute: dir, multiplier: 1, constant: 12))
        }
        
        contentView.addConstraint(NSLayoutConstraint(item: delete, attribute: .top, relatedBy: .equal,
                                                         toItem: contentView, attribute: .top, multiplier: 1, constant: 12))
        delete.addConstraint(NSLayoutConstraint(item: delete, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
