//
//  HC+CoreLocationExtension.swift
//  FoodStep
//
//  Created by C4Q on 12/11/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import UIKit
import CoreLocation


extension HomeController {
    func loadCurrentLocationData() {
        mainMapView.mainMapView.showsUserLocation = true
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation()
        locationManager.requestLocation()
        guard let location = locationManager.location else {return}
        UserDefaultsHelper.manager.save(coordinate: String(location.coordinate.latitude), nameKey: "currentLocationLat")
        UserDefaultsHelper.manager.save(coordinate: String(location.coordinate.longitude), nameKey: "currentLocationlong")
    }
//    func requestLocation () -> CLLocation? {
//        locationManager.startUpdatingLocation()
//        locationManager.requestLocation()
//
//        return locationManager.location
//    }
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationAutherization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            loadCurrentLocationData()
        case .denied:
            // Show Alert
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Show messahe
            break
        case .authorizedAlways:
            break
        }
    }
    
    func checkLocationService() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAutherization()
     
        } else {
            //SHow Alert
        }
    }
}

extension HomeController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
 

    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAutherization()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}



