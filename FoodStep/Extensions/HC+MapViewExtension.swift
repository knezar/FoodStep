//
//  HC+MapViewExtenssion.swift
//  FoodStep
//
//  Created by C4Q on 12/14/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//
import UIKit
import MapKit

extension HomeController {
    
    func setupMapView () {
        view.addSubview(mainMapView)
    }
    
    func centerViewOnUserLocation(){
        if let location = locationManager.location{
            let span = MKCoordinateSpan(latitudeDelta: 1/100, longitudeDelta: 1/100)
            let region = MKCoordinateRegion.init(center: location.coordinate, span: span)
            mainMapView.mainMapView.setRegion(region, animated: true)
        }
    }
    
    func setupAnnotations() {
        let annotations = feedCell.venueData.map{self.annotationForLocation($0)}
        mainMapView.mainMapView.addAnnotations(annotations)
    }
    func annotationForLocation(_ location: Venue) -> MKPointAnnotation{
        let annotation = MKPointAnnotation()
        let address = location.geoLocation.formattedAddress.joined()
        annotation.subtitle = address
        annotation.title = location.name
        annotation.coordinate = CLLocationCoordinate2D(latitude: location.geoLocation.lat, longitude: location.geoLocation.lng)
        return annotation
    }
    
    
}
