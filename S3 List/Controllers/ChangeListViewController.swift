//
//  ChangeListViewController.swift
//  S3 List
//
//  Created by Fernando Jinzenji on 2018-05-31.
//  Copyright © 2018 Fernando Jinzenji. All rights reserved.
//

import UIKit

class ChangeListViewController: UIViewController {

    var contentView: ChangeListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.contentView = ChangeListView()
        self.view = self.contentView        
        
    }
}
