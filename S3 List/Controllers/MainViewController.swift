//
//  MainViewController.swift
//  S3 List
//
//  Created by Fernando Jinzenji on 2018-05-29.
//  Copyright © 2018 Fernando Jinzenji. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listViewController = ListViewController()
        listViewController.tabBarItem = UITabBarItem(title: "My List", image: #imageLiteral(resourceName: "list_tab"), tag: 0)
        
        let changeListViewController = ChangeListViewController()
        changeListViewController.tabBarItem = UITabBarItem(title: "Change List", image: #imageLiteral(resourceName: "changelist_tab"), tag: 1)
        
        let settingsViewController = SettingsViewController()
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: #imageLiteral(resourceName: "changelist_tab"), tag: 2)
        
        self.viewControllers = [listViewController, changeListViewController, settingsViewController]
    }
}
