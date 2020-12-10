//
//  tabBarController.swift
//  Assignment 2 dialpad
//
//  Created by zeking on 11/8/20.
//

import UIKit
class tabBarController: UITabBarController {

    @IBInspectable var defaultIndex: Int = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = defaultIndex
    }

}
