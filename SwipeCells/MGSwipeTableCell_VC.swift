//
//  MGSwipeTableCell_VC.swift
//  SwipeCells
//
//  Created by Vlad on 01/02/2017.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation
import UIKit
import MGSwipeTableCell

class MGSwipeTableCell_VC: BaseTableViewController, MGSwipeTableCellDelegate {
    let reuseIdentifier = "programmaticCell"
    
    func swipeTableCell(_ cell: MGSwipeTableCell, tappedButtonAt index: Int, direction: MGSwipeDirection, fromExpansion: Bool) -> Bool {
        // woow! so fucking stupid delegate. BUTTON AT INTEGER INDEX!
        print("was tapped button #\(index) on \(direction == .rightToLeft ? "right" : "left") direction, on cell \(cell); from wtf \(fromExpansion) expansion??")
        if let indexPath = tableView.indexPath(for: cell), index == 0 && direction == .rightToLeft {
            tableView.beginUpdates()
            self.data[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        return true
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = MGCell(style: .default, reuseIdentifier: reuseIdentifier)
        cell.textView.text = data[indexPath.section][indexPath.row]
        
        cell.textView.showHideCallback = { [unowned self] _ in
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
        
        cell.delegate = self //optional
        
        //configure left buttons
        cell.leftButtons = [MGSwipeButton(title: "tutu", backgroundColor: UIColor.green)
            ,MGSwipeButton(title: "ruu", backgroundColor: UIColor.blue)]
        cell.leftSwipeSettings.transition = MGSwipeTransition.rotate3D
        
        //configure right buttons
        let delete = MGSwipeButton(title: "Delete", icon: UIImage(named: "remove"), backgroundColor: UIColor.red)
        delete.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        delete.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        delete.frame.size.width += 10
        cell.rightButtons = [delete, MGSwipeButton(title: "More",backgroundColor: UIColor.lightGray)]
        cell.rightSwipeSettings.transition = MGSwipeTransition.rotate3D
        
        return cell
    }
}
