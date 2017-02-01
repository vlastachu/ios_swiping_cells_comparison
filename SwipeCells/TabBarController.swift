//
//  TabBarController.swift
//  SwipeCells
//
//  Created by Vlad on 31/01/2017.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        tabBar.unselectedItemTintColor = UIColor(red: 180/255, green: 60/255, blue: 0, alpha: 1)
    }
}
