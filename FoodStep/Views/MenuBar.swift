//
//  MenuBar.swift
//  FoodStep
//
//  Created by C4Q on 12/4/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    var menuBarArray = ["Nearby", "Popular", "Top Review", "Filter"]
    var whiteBarLeftAnchorConstraint: NSLayoutConstraint?
    let cellId = "cellId"
    
    var HomeVC: HomeController?
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = UIColor.getRGB(red: 45, green: 119, blue: 135)
        
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let whiteBarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        return view
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        collectionView.register(menuBarCell.self, forCellWithReuseIdentifier: cellId)
        let selectedItem = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedItem, animated: false, scrollPosition: UICollectionView.ScrollPosition())
        setupCollectionView()
        setupWhiteBarEffect()
    }
    
    
    private func setupWhiteBarEffect(){
        addSubview(whiteBarView)
        whiteBarView.translatesAutoresizingMaskIntoConstraints = false
        whiteBarLeftAnchorConstraint = whiteBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        whiteBarLeftAnchorConstraint?.isActive = true
        whiteBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        whiteBarView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4).isActive = true
        whiteBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    private func setupCollectionView(){
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuBarArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! menuBarCell
        cell.menuBarLabel.text = menuBarArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        HomeVC?.scrollToMenuIndex(menuIndex: indexPath.item)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


