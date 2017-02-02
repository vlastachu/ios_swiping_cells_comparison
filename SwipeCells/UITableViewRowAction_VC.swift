//
//  UITableViewRowAction_VC.swift
//  SwipeCells
//
//  Created by Vlad on 31/01/2017.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation
import UIKit

class UITableViewRowAction_VC: BaseTableViewController {
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // possible to add image via UIColor(patternImage: UIImage(named: ""))
        let 🗑 = UITableViewRowAction(style: .default, title: "Remove Record", handler: {[unowned self] _,index in
            tableView.beginUpdates()
            self.data[index.section].remove(at: index.row)
            tableView.deleteRows(at: [index], with: .automatic)
            tableView.endUpdates()
            print("Delete closure called")
        })
        
        let 🌟 = UITableViewRowAction(style: .normal, title: "More", handler: {_,_ in print("More closure called")})
        
        return [🗑, 🌟]
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // Intentionally blank. Required to use UITableViewRowActions
    }
}
