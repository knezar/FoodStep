//
//  ViewController.swift
//  FoodStep
//
//  Created by C4Q on 12/1/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class HomeController: UIViewController {

    
    
//    var venueData: [Item] = [Item]() {
//        didSet {
//            print(self.venueData.first?.venue.name)
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//                
//            }
//        }
//    }
    var locationName = Double()
    let graphicHelper = GraphicHelper()
    let locationManager = CLLocationManager()
    let feedCell = FeedCell()
    var searchLocation: (Double, Double)?
    
//    var previousLocation: CLLocation?
//    let termSearch: NavSearchBarViewContainer = {
//        let searchBar = NavSearchBarViewContainer()
//        searchBar.isHidden = false
//        return searchBar
//    }()

    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.isHidden = false
        mb.HomeVC = self
        return mb
    }()
    lazy var mainMapView: MapView = {
        let mv = MapView()
        mv.frame = CGRect(x: 0, y: -view.frame.height , width: view.frame.width, height: view.frame.height )
        return mv
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isHidden = false
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationService()
        setupNavBar()
        setupMenuBar()
        setupMainCollectionView()

    }
    
    func loadManualSearchData(coordinates: CLLocationCoordinate2D){
//        
//        ClientAPI.manager.getWeather(from: (coordinates.latitude, coordinates.longitude), completionHandler: {self.venueData = $0}, errorHandler: {print($0)})
    }

    @objc func handleMarker() {
        let dimmView = graphicHelper.dimmScreen(view: view)
        view.addSubview(dimmView)
        dimmView.translatesAutoresizingMaskIntoConstraints = false
        dimmView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dimmView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dimmView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        dimmView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        graphicHelper.animateMapView(view: mainMapView)
        let collectionButton = graphicHelper.setNavBarImages(image: #imageLiteral(resourceName: "1887040-48"), width: 30)
        collectionButton.addTarget(self, action: #selector(handleCollectionButtonPRessed), for: .touchUpInside)
        let collectionBarButton = UIBarButtonItem(customView: collectionButton)
        navigationItem.rightBarButtonItem = collectionBarButton
        setupMapView()
        centerViewOnUserLocation()
        setupAnnotations()
        view.bringSubviewToFront(menuBar)
    }
    @objc func handleCollectionButtonPRessed() {
        let markerButton = graphicHelper.setNavBarImages(image: #imageLiteral(resourceName: "1071016-64"), width: 30)
        markerButton.addTarget(self, action: #selector(handleMarker), for: .touchUpInside)
        let markerBarButton = UIBarButtonItem(customView: markerButton)
        navigationItem.rightBarButtonItem = markerBarButton
        graphicHelper.dismissDimmedView()
        graphicHelper.dismissMap(view: mainMapView)
    }
    @objc func handleProfile() {
        scrollToMenuIndex(menuIndex: 2)
        
    }
    @objc func handleSearchButton() {
        let searchController = SearchViewController()
//        searchController.delegate = self
        present(searchController, animated: true, completion: nil)
    }

    func setupMenuBar() {
        view.addSubview(menuBar)
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
