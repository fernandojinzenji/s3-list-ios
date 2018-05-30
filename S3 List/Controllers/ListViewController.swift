//
//  ListViewController.swift
//  S3 List
//
//  Created by Fernando Jinzenji on 2018-05-29.
//  Copyright © 2018 Fernando Jinzenji. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    var contentView: ListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.contentView = ListView()
        self.view = self.contentView
        
        var items = [Item]()
        items.append(Item(itemID: 11, name: "Milk"))
        items.append(Item(itemID: 12, name: "Cheese"))
        items.append(Item(itemID: 13, name: "Chicken"))
        items.append(Item(itemID: 14, name: "Ice cream"))
        
        self.contentView.listItems(items: items)
    }

}
