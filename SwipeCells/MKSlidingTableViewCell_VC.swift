//
//  MKSlidingTableViewCell_VC.swift
//  SwipeCells
//
//  Created by Vlad on 02/02/2017.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation
import MKSlidingTableViewCell

class MKSlidingTableViewCell_VC: BaseTableViewController {
    let reuseId1 = "reuseId1"
    let reuseId2 = "reuseId2"
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MKSlidingTableViewCell(style: .default, reuseIdentifier: reuseId1)
        cell.foregroundView = super.tableView(tableView, cellForRowAt: indexPath)
        let bgCell = MKBackgroundCell(style: .default, reuseIdentifier: reuseId2)
        cell.drawerView = bgCell
        cell.drawerRevealAmount = 124
        bgCell.delete.addOnTap { [unowned self] in
            tableView.beginUpdates()
            self.data[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        return cell
    }
}
