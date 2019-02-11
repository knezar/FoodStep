//
//  SearchView.swift
//  FoodStep
//
//  Created by C4Q on 12/6/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import UIKit

class NavSearchBarViewContainer: UIView {
    
    let searchBar: UISearchBar

    
    init(customSearchBar: UISearchBar) {
        searchBar = customSearchBar
        super.init(frame: CGRect.zero)
        addSubview(searchBar)
    }
    
    override convenience init(frame: CGRect) {
        self.init(customSearchBar: UISearchBar())
        self.frame = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        searchBar.frame = bounds
 
    }
}

