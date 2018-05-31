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
    var noItemsView: UIView!
    var noItemsLabel: UILabel!
    var addFirstButton: UIButton!
    var undoButton: UIButton!
    var newItemTextField: UITextField!
    
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
        
        undoButton = UIButton()
        undoButton.setTitle("Undo", for: .normal)
        undoButton.titleLabel?.font = UIFont.getAppFontREGULAR(size: 17.0)
        undoButton.layer.borderWidth = 0.5
        undoButton.layer.borderColor = UIColor.darkGray.cgColor
        undoButton.backgroundColor = UIColor.lightGray
        undoButton.layer.cornerRadius = 18.0
        undoButton.translatesAutoresizingMaskIntoConstraints = false
        undoButton.isHidden = true
        self.addSubview(undoButton)
        undoButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        undoButton.topAnchor.constraint(equalTo: lastUpdateLabel.bottomAnchor, constant: 12.0).isActive = true
        undoButton.widthAnchor.constraint(equalToConstant: 72.0).isActive = true
        undoButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        itemsView = UIView()
        itemsView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(itemsView)
        itemsView.topAnchor.constraint(equalTo: lastUpdateLabel.bottomAnchor, constant: 24.0).isActive = true
        itemsView.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor).isActive = true
        itemsView.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor).isActive = true
        itemsView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -12.0).isActive = true
        
        noItemsView = UIView()
        noItemsView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(noItemsView)
        noItemsView.topAnchor.constraint(equalTo: lastUpdateLabel.bottomAnchor, constant: 18.0).isActive = true
        noItemsView.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor).isActive = true
        noItemsView.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor).isActive = true
        noItemsView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -12.0).isActive = true
        
        noItemsLabel = UILabel()
        noItemsLabel.text = "No items yet"
        noItemsLabel.font = UIFont.getAppFontLIGHT(size: 22.0)
        noItemsLabel.textColor = UIColor.darkGray
        noItemsLabel.translatesAutoresizingMaskIntoConstraints = false
        noItemsView.addSubview(noItemsLabel)
        noItemsLabel.centerXAnchor.constraint(equalTo: noItemsView.centerXAnchor).isActive = true
        noItemsLabel.centerYAnchor.constraint(equalTo: noItemsView.centerYAnchor, constant: -22.0).isActive = true
        
        addFirstButton = UIButton()
        addFirstButton.titleLabel?.font = UIFont.getAppFontREGULAR(size: 22.0)
        addFirstButton.setTitle("+ add new", for: .normal)
        addFirstButton.setTitleColor(UIColor.blue, for: .normal)
        addFirstButton.addTarget(self, action: #selector(addFirstButtonTapped), for: .touchUpInside)
        addFirstButton.translatesAutoresizingMaskIntoConstraints = false
        noItemsView.addSubview(addFirstButton)
        addFirstButton.centerXAnchor.constraint(equalTo: noItemsView.centerXAnchor).isActive = true
        addFirstButton.topAnchor.constraint(equalTo: noItemsLabel.bottomAnchor, constant: 4.0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func noItemsSectionHidden(isHidden: Bool) {
        noItemsView.isHidden = isHidden
        itemsView.isHidden = !isHidden
    }
    
    private func showUndo(isHidden: Bool) {
        undoButton.isHidden = isHidden
    }
}

// Button handlers
extension ListView {
    
    @objc private func addFirstButtonTapped() {
        self.noItemsSectionHidden(isHidden: true)
    }
    
    @objc private func checkboxTapped(sender: UIButton) {
        
        items.remove(at: 0)
        
        sender.setImage(#imageLiteral(resourceName: "checked_icon"), for: .normal)
        
        showUndo(isHidden: false)
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (t) in
            
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut, animations: {
                sender.alpha = 0.0
                sender.superview?.removeFromSuperview()
                
                self.showUndo(isHidden: true)
            }, completion: { (success) in
                self.listItems(items: self.items)
            })
        }
    }
}

// Public functions
extension ListView {
    
    public func listItems(items: [Item]) {
        
        self.itemsView.subviews.forEach { $0.removeFromSuperview() }
        self.items = items
        
        self.noItemsSectionHidden(isHidden: (self.items.count > 0))
        
        for index in 0..<items.count {

            let item = items[index]

            let rowView = UIView()
            rowView.translatesAutoresizingMaskIntoConstraints = false
            itemsView.addSubview(rowView)
            let topAnchorValue = 56.0 * CGFloat(index)
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
            rowView.addSubview(separator)
            separator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
            separator.topAnchor.constraint(equalTo: rowView.bottomAnchor, constant: 2.0).isActive = true
            separator.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor).isActive = true
            separator.rightAnchor.constraint(equalTo: rowView.rightAnchor).isActive = true
        }
        
        newItemTextField = UITextField()
        newItemTextField.translatesAutoresizingMaskIntoConstraints = false
        newItemTextField.attributedPlaceholder = NSAttributedString(string: "New item",
                                                                    attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        newItemTextField.font = UIFont.getAppFontLIGHT(size: 22.0)
        newItemTextField.textColor = UIColor.darkGray
        newItemTextField.returnKeyType = .done
        newItemTextField.delegate = self
        itemsView.addSubview(newItemTextField)
        newItemTextField.topAnchor.constraint(equalTo: itemsView.topAnchor, constant: 56.0 * CGFloat(items.count)).isActive = true
        newItemTextField.heightAnchor.constraint(equalToConstant: 48.0).isActive = true
        newItemTextField.leftAnchor.constraint(equalTo: itemsView.leftAnchor, constant: 48.0).isActive = true
        newItemTextField.rightAnchor.constraint(equalTo: itemsView.rightAnchor, constant: -4.0).isActive = true
        
        let separator = UIView()
        separator.backgroundColor = UIColor.lightGray
        separator.translatesAutoresizingMaskIntoConstraints = false
        itemsView.addSubview(separator)
        separator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        separator.topAnchor.constraint(equalTo: newItemTextField.bottomAnchor, constant: 2.0).isActive = true
        separator.leftAnchor.constraint(equalTo: newItemTextField.leftAnchor).isActive = true
        separator.rightAnchor.constraint(equalTo: newItemTextField.rightAnchor).isActive = true
    }
    
    public func dismissKeyboard() {
        newItemTextField.resignFirstResponder()
    }
}

// UITextFieldDelegate
extension ListView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
}
