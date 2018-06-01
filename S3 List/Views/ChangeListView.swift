//
//  ChangeListView.swift
//  S3 List
//
//  Created by Fernando Jinzenji on 2018-05-31.
//  Copyright © 2018 Fernando Jinzenji. All rights reserved.
//

import Foundation
import UIKit

class ChangeListView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        let listManagerLabel = UILabel()
        listManagerLabel.text = "List Manager"
        listManagerLabel.font = UIFont.getAppFontBOLD(size: 32.0)
        listManagerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(listManagerLabel)
        listManagerLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 16.0).isActive = true
        listManagerLabel.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor, constant: 16.0).isActive = true
        
        let addNewLabel = UILabel()
        addNewLabel.text = "Add New List"
        addNewLabel.font = UIFont.getAppFontBOLD(size: 22.0)
        addNewLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addNewLabel)
        addNewLabel.topAnchor.constraint(equalTo: listManagerLabel.bottomAnchor, constant: 24.0).isActive = true
        addNewLabel.leftAnchor.constraint(equalTo: listManagerLabel.leftAnchor, constant: -4.0).isActive = true
        
        let newItemTextField = UITextField()
        newItemTextField.translatesAutoresizingMaskIntoConstraints = false
        newItemTextField.attributedPlaceholder = NSAttributedString(string: " Your cool list name",
                                                                    attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        newItemTextField.font = UIFont.getAppFontLIGHT(size: 20.0)
        newItemTextField.textColor = UIColor.darkGray
        newItemTextField.returnKeyType = .done
        newItemTextField.layer.borderColor = UIColor.lightGray.cgColor
        newItemTextField.layer.borderWidth = 0.5
        newItemTextField.layer.cornerRadius = 15.0
        self.addSubview(newItemTextField)
        newItemTextField.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor, constant: 12.0).isActive = true
        newItemTextField.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor, constant: -12.0).isActive = true
        newItemTextField.heightAnchor.constraint(equalToConstant: 48.0).isActive = true
        newItemTextField.topAnchor.constraint(equalTo: addNewLabel.bottomAnchor, constant: 4.0).isActive = true
        
        let shareCodeLabel = UILabel()
        shareCodeLabel.text = "Access a Shared List"
        shareCodeLabel.font = UIFont.getAppFontBOLD(size: 22.0)
        shareCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(shareCodeLabel)
        shareCodeLabel.topAnchor.constraint(equalTo: newItemTextField.bottomAnchor, constant: 18.0).isActive = true
        shareCodeLabel.leftAnchor.constraint(equalTo: listManagerLabel.leftAnchor, constant: -4.0).isActive = true
        
        let shareCodeTextField = UITextField()
        shareCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        shareCodeTextField.attributedPlaceholder = NSAttributedString(string: " Add a shared list code",
                                                                    attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        shareCodeTextField.font = UIFont.getAppFontLIGHT(size: 20.0)
        shareCodeTextField.textColor = UIColor.darkGray
        shareCodeTextField.returnKeyType = .done
        shareCodeTextField.layer.borderColor = UIColor.lightGray.cgColor
        shareCodeTextField.layer.borderWidth = 0.5
        shareCodeTextField.layer.cornerRadius = 15.0
        self.addSubview(shareCodeTextField)
        shareCodeTextField.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor, constant: 12.0).isActive = true
        shareCodeTextField.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor, constant: -12.0).isActive = true
        shareCodeTextField.heightAnchor.constraint(equalToConstant: 42.0).isActive = true
        shareCodeTextField.topAnchor.constraint(equalTo: shareCodeLabel.bottomAnchor, constant: 4.0).isActive = true
        
        let myListsLabel = UILabel()
        myListsLabel.text = "My Lists"
        myListsLabel.font = UIFont.getAppFontBOLD(size: 22.0)
        myListsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(myListsLabel)
        myListsLabel.topAnchor.constraint(equalTo: shareCodeTextField.bottomAnchor, constant: 18.0).isActive = true
        myListsLabel.leftAnchor.constraint(equalTo: listManagerLabel.leftAnchor, constant: -4.0).isActive = true
        
        let tableView = UITableView()
        tableView.register(ChangeListTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: myListsLabel.bottomAnchor, constant: 4.0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor, constant: 12.0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor, constant: -12.0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -12.0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ChangeListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ChangeListTableViewCell
        return cell
    }
    
}
