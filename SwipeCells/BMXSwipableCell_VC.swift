//
//  BMXSwipableCell_VC.swift
//  SwipeCells
//
//  Created by Vlad on 01/02/2017.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation
import BMXSwipableCell


// BMX is looks like shit. It is my guilty too - I'm tired setting up shit
// but on this step you can see that this is not bode well

class BMXSwipableCell_VC: BaseTableViewController {
    let reuseIdentifier = "programmaticCell"
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = BMXCell(style: .default, reuseIdentifier: reuseIdentifier)
        cell.textView.text = data[indexPath.section][indexPath.row]
        
        cell.textView.showHideCallback = { [unowned self] _ in
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
        
        //cell.delegate = self //optional
        
        let delete = UIButton(type: .custom)
        delete.backgroundColor = UIColor(red: 1, green: 0.231, blue: 0.188, alpha: 1)
        delete.setTitle("Delete", for: .normal)
        delete.setTitleColor(UIColor.white, for: .normal)
        delete.addOnTap(callback: {[unowned self] in
            tableView.beginUpdates()
            self.data[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        })
        delete.setImage(UIImage(named: "remove"), for: .normal)
        let h = cell.basementView.frame.width
        delete.frame = CGRect(x: cell.basementView.frame.width - h, y: 0, width: h, height: h)
        cell.basementView.addSubview(delete)
        
        
        return cell
    }
}
