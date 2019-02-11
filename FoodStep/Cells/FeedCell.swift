//
//  FeedCellCollectionViewCell.swift
//  FoodStep
//
//  Created by C4Q on 12/16/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//


import UIKit

class FeedCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource, MyProtocol {
    let myImage = UIImage(named: "foodLandscaped")
    let cellId = "cellId"
    var venueData: [Venue] = [Venue]() {
        didSet {
            DispatchQueue.main.async {
                print(self.venueData.first?.name)
                self.cellCollectionView.reloadData()
            }
        }
    }
    lazy var cellCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.isHidden = false
        cv.dataSource = self
        cv.delegate = self
        //        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
        fetchData()
    }
    
    func fetchData() {
        if let latLocation = UserDefaultsHelper.manager.getLastSearch(nameKey: "currentLocationLat"), let longLocation = UserDefaultsHelper.manager.getLastSearch(nameKey: "currentLocationlong") {
            ClientAPI.manager.getVenueData(from: (Double(latLocation)!,Double(longLocation)!), completionHandler: {self.venueData = $0}, errorHandler: {print($0)})
        }
    }
    func getLocationFromSearchController(location: (Double, Double)) {
        ClientAPI.manager.getVenueData(from: location, completionHandler: {self.venueData = $0}, errorHandler: {print($0)})
        cellCollectionView.reloadData()
    }
//    
//    func fetchDataFromSearchField(coordinates: (Double, Double)){
//        ClientAPI.manager.getVenueData(from: (coordinates.0, coordinates.1), completionHandler: {self.venueData = $0}, errorHandler: {print($0)})
//        cellCollectionView.reloadData()
//    }
    
    
    func setupViews() {
        subViewConstraints()
    }
    
    private func subViewConstraints() {
        cellCollectionView.register(GridCell.self, forCellWithReuseIdentifier: "cellId")
        addSubview(cellCollectionView)
        cellCollectionView.translatesAutoresizingMaskIntoConstraints = false
        cellCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cellCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cellCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        cellCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return venueData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! GridCell
        let sortedVenues = venueData.sorted(by: {$0.geoLocation.distance < $1.geoLocation.distance})
        
        cell.titleLabel.text = sortedVenues[indexPath.item].name
        cell.thumbnailImageView.image = myImage
        var addtext = ""
        for text in sortedVenues[indexPath.item].geoLocation.formattedAddress {
            addtext.append("\(text) \n")
        }
        cell.discriptionLabel.text = addtext
        cell.distanceLabel.text = "\(sortedVenues[indexPath.item].geoLocation.distance) m"
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let item = collectionView.cellForItem(at: indexPath)
        if item?.isSelected ?? false {
            collectionView.deselectItem(at: indexPath, animated: true)
            collectionView.performBatchUpdates(nil, completion: nil)
            collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
            
            return false
        } else {
            return true
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.performBatchUpdates(nil, completion: nil)
        collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.indexPathsForSelectedItems?.first {
        case .some(indexPath):
            return CGSize(width: frame.width - 20, height: (frame.height - 20))
        default:
            return CGSize(width: frame.width * 0.46, height: 0.46 * frame.width * (myImage?.getCropRatio())!)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let x = CGFloat(10)
        return UIEdgeInsets(top: x, left: x, bottom: x, right: x)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

