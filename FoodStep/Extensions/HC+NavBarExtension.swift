//
//  HomeController+NavBar.swift
//  FoodStep
//
//  Created by C4Q on 12/8/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import UIKit

extension HomeController {
    func setupNavBar(){
        let markerButton = graphicHelper.setNavBarImages(image: #imageLiteral(resourceName: "1071016-64"), width: 30)
        markerButton.addTarget(self, action: #selector(handleMarker), for: .touchUpInside)
        let markerBarButton = UIBarButtonItem(customView: markerButton)
 
        let profileButton = graphicHelper.setNavBarImages(image: #imageLiteral(resourceName: "obama"), width: 35)
        profileButton.addTarget(self, action: #selector(handleProfile), for: .touchUpInside)
        let profileBarButton = UIBarButtonItem(customView: profileButton)
        
        let searchButton = graphicHelper.setNavBarImages(image: #imageLiteral(resourceName: "1055031-48"), width: 30)
        searchButton.addTarget(self, action: #selector(handleSearchButton), for: .touchUpInside)
        let searchBarButton = UIBarButtonItem(customView: searchButton)
        
        navigationItem.leftBarButtonItem = profileBarButton
        navigationItem.rightBarButtonItems = [markerBarButton, searchBarButton]
        navigationController?.navigationBar.isTranslucent = false
        
    }
}


extension HomeController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
}
