//
//  HomeController+MainCollectionView.swift
//  FoodStep
//
//  Created by C4Q on 12/8/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import UIKit

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func setupMainCollectionView() {
        
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.register(TrendingCell.self, forCellWithReuseIdentifier: "trendingCellId")
        collectionView.register(TopReviewCell.self, forCellWithReuseIdentifier: "topRevCell")

        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: menuBar.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        } else if indexPath.item == 1 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "trendingCellId", for: indexPath)
        } else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "topRevCell", for: indexPath)
        } 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - menuBar.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.whiteBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x/4
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.move().x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
    }
}
