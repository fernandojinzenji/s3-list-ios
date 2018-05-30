//
//  ListView.swift
//  S3 List
//
//  Created by Fernando Jinzenji on 2018-05-29.
//  Copyright © 2018 Fernando Jinzenji. All rights reserved.
//

import Foundation
import UIKit

class ListView: UIView {
    
    var itemsView: UIView!
    var noItemsLabel: UILabel!
    var addFirstButton: UIButton!
    
    public var items = [Item]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        let listNameLabel = UILabel()
        listNameLabel.text = "List Name"
        listNameLabel.font = UIFont.getAppFontBOLD(size: 32.0)
        listNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(listNameLabel)
        listNameLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 16.0).isActive = true
        listNameLabel.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor, constant: 16.0).isActive = true
        
        let shareButton = UIButton()
        shareButton.setImage(#imageLiteral(resourceName: "sharebutton"), for: .normal)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(shareButton)
        shareButton.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 16.0).isActive = true
        shareButton.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor, constant: -12.0).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        
        let lastUpdateLabel = UILabel()
        lastUpdateLabel.text = "Last updated 10s ago"
        lastUpdateLabel.font = UIFont.getAppFontLIGHT(size: 16.0)
        lastUpdateLabel.textColor = UIColor.darkGray
        lastUpdateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lastUpdateLabel)
        lastUpdateLabel.topAnchor.constraint(equalTo: listNameLabel.bottomAnchor, constant: 4.0).isActive = true
        lastUpdateLabel.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor, constant: 16.0).isActive = true
        
        itemsView = UIView()
        itemsView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(itemsView)
        itemsView.topAnchor.constraint(equalTo: lastUpdateLabel.bottomAnchor, constant: 18.0).isActive = true
        itemsView.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor).isActive = true
        itemsView.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor).isActive = true
        itemsView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -12.0).isActive = true
        
        noItemsLabel = UILabel()
        noItemsLabel.text = "No items yet"
        noItemsLabel.font = UIFont.getAppFontLIGHT(size: 22.0)
        noItemsLabel.textColor = UIColor.darkGray
        noItemsLabel.translatesAutoresizingMaskIntoConstraints = false
        itemsView.addSubview(noItemsLabel)
        noItemsLabel.centerXAnchor.constraint(equalTo: itemsView.centerXAnchor).isActive = true
        noItemsLabel.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor, constant: -22.0).isActive = true
        
        addFirstButton = UIButton()
        addFirstButton.titleLabel?.font = UIFont.getAppFontREGULAR(size: 22.0)
        addFirstButton.setTitle("+ add new", for: .normal)
        addFirstButton.setTitleColor(UIColor.blue, for: .normal)
        addFirstButton.addTarget(self, action: #selector(addFirstButtonTapped), for: .touchUpInside)
        addFirstButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addFirstButton)
        addFirstButton.centerXAnchor.constraint(equalTo: itemsView.centerXAnchor).isActive = true
        addFirstButton.topAnchor.constraint(equalTo: noItemsLabel.bottomAnchor, constant: 4.0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func noItemsSectionHidden(isHidden: Bool) {
        noItemsLabel.isHidden = isHidden
        addFirstButton.isHidden = isHidden
    }
}

// Button handlers
extension ListView {
    
    @objc private func addFirstButtonTapped() {
        self.noItemsSectionHidden(isHidden: true)
        
        let testView = generateAddItem()
        self.itemsView.addSubview(testView)
    }
    
    @objc private func checkboxTapped(sender: UIButton) {
        sender.setImage(#imageLiteral(resourceName: "checked_icon"), for: .normal)
        
        
    }
    
}

// Public functions
extension ListView {
    
    public func listItems(items: [Item]) {
        self.items = items
        
        for index in 0..<items.count {
            
            let item = items[index]
            
            let rowView = UIView()
            rowView.translatesAutoresizingMaskIntoConstraints = false
            itemsView.addSubview(rowView)
            let topAnchorValue = (8.0 * CGFloat(index)) + (48.0 * CGFloat(index))
            rowView.topAnchor.constraint(equalTo: itemsView.topAnchor, constant: topAnchorValue).isActive = true
            rowView.heightAnchor.constraint(equalToConstant: 48.0).isActive = true
            rowView.leftAnchor.constraint(equalTo: itemsView.leftAnchor, constant: 4.0).isActive = true
            rowView.rightAnchor.constraint(equalTo: itemsView.rightAnchor, constant: -4.0).isActive = true
            
            let checkbox = UIButton()
            checkbox.setImage(#imageLiteral(resourceName: "unchecked_icon"), for: .normal)
            checkbox.translatesAutoresizingMaskIntoConstraints = false
            checkbox.tag = item.itemID
            checkbox.addTarget(self, action: #selector(checkboxTapped(sender:)), for: .touchUpInside)
            rowView.addSubview(checkbox)
            checkbox.centerYAnchor.constraint(equalTo: rowView.centerYAnchor).isActive = true
            checkbox.leftAnchor.constraint(equalTo: rowView.leftAnchor).isActive = true
            checkbox.heightAnchor.constraint(equalToConstant: 36.0).isActive = true
            checkbox.widthAnchor.constraint(equalToConstant: 36.0).isActive = true
            
            let itemNameLabel = UILabel()
            itemNameLabel.text = item.name.capitalized
            itemNameLabel.font = UIFont.getAppFontLIGHT(size: 22.0)
            itemNameLabel.textColor = UIColor.darkGray
            itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
            itemsView.addSubview(itemNameLabel)
            itemNameLabel.centerYAnchor.constraint(equalTo: rowView.centerYAnchor).isActive = true
            itemNameLabel.leftAnchor.constraint(equalTo: checkbox.rightAnchor, constant: 8.0).isActive = true
            
            let separator = UIView()
            separator.backgroundColor = UIColor.lightGray
            separator.translatesAutoresizingMaskIntoConstraints = false
            itemsView.addSubview(separator)
            separator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
            separator.topAnchor.constraint(equalTo: rowView.bottomAnchor, constant: 2.0).isActive = true
            separator.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor).isActive = true
            separator.rightAnchor.constraint(equalTo: rowView.rightAnchor).isActive = true
        }
    }
    
    public func generateAddItem() -> UIView {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
}
