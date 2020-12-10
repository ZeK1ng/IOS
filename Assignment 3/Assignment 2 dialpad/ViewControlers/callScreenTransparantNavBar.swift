//
//  callScreenTransparantNavBar.swift
//  Assignment 2 dialpad
//
//  Created by zeking on 11/8/20.
//

import UIKit

class callScreenTransparantNavBar:UINavigationController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarAppearance()
    }
    func setupNavBarAppearance(){
        let navBarApp = UINavigationBarAppearance()
        navBarApp.configureWithTransparentBackground()
        navBarApp.backgroundImage=UIImage()
        navBarApp.shadowImage=UIImage()
        navigationBar.compactAppearance = navBarApp
        navigationBar.standardAppearance = navBarApp
        navigationBar.scrollEdgeAppearance = navBarApp
        
    }
}
