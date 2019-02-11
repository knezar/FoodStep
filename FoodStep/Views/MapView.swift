//
//  mapView.swift
//  FoodStep
//
//  Created by C4Q on 12/6/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapView: UIView {
    
    var location = [Venue]() {
        didSet{
            mainMapView.reloadInputViews()
        }
    }
    
    lazy var mainMapView: MKMapView = {
        let map = MKMapView()
        map.mapType = MKMapType.standard
        map.delegate = self
        map.isZoomEnabled = true
        map.isScrollEnabled = true
        map.showsCompass = false
        let scale = MKScaleView(mapView: map)
        scale.scaleVisibility = .visible // always visible
        addSubview(scale)
        map.showsScale = true
        return map
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview(mainMapView)
        setupViews()
    }
    
    private func setupViews(){
        mainMapView.translatesAutoresizingMaskIntoConstraints = false
        mainMapView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainMapView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainMapView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainMapView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func getMapCenterLocation(for mapView: MKMapView) -> CLLocationCoordinate2D {
        let center = mapView.centerCoordinate
        return center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension MapView: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
//        let center = getMapCenterLocation(for: mapView)

//            let annotations = location.map{self.annotationForLocation($0)}
//            self.mainMapView.addAnnotations(annotations)

    }
    
    //    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    //        <#code#>
    //    }
    
    
    
}
