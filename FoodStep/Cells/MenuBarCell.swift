//
//  MenuBarCell.swift
//  FoodStep
//
//  Created by C4Q on 12/5/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import UIKit

class menuBarCell: UICollectionViewCell {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    
    let menuBarLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.textColor = UIColor.lightGray
        return label
    }()
    override var isHighlighted: Bool {
        didSet {
            menuBarLabel.textColor = isHighlighted ? UIColor.white : UIColor.lightGray
            menuBarLabel.font = isHighlighted ? UIFont.boldSystemFont(ofSize: 15) : UIFont.systemFont(ofSize: 13)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            menuBarLabel.textColor = isSelected ? UIColor.white : UIColor.lightGray
            menuBarLabel.font = isSelected ? UIFont.boldSystemFont(ofSize: 15) : UIFont.systemFont(ofSize: 13)
        }
    }
    
    private func setupViews() {
        addSubview(menuBarLabel)
        
        menuBarLabel.translatesAutoresizingMaskIntoConstraints = false
        menuBarLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        menuBarLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        menuBarLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        menuBarLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

