//
//  TrendingCell.swift
//  FoodStep
//
//  Created by C4Q on 12/23/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import Foundation

class TrendingCell: FeedCell {
    override func fetchData() {
        ClientAPI.manager.getTrendingVenueData(from: (40.7, -74), completionHandler: {(venues) in
            self.venueData = venues
            self.cellCollectionView.reloadData()
        }
            , errorHandler: {print($0)})
    }
}
