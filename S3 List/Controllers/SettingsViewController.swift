//
//  SettingsViewController.swift
//  S3 List
//
//  Created by Fernando Jinzenji on 2018-05-31.
//  Copyright © 2018 Fernando Jinzenji. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var contentView: SettingsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.contentView = SettingsView()
        self.view = self.contentView
    }
}
