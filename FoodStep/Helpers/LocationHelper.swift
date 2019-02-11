//
//  LocationHelper.swift
//  FoodStep
//
//  Created by C4Q on 12/7/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import Foundation
import CoreLocation
class CityNameHelper {
    private init() {}
    static let manager = CityNameHelper()
    func getLocationName(from textFieldString: String, completionHandler: @escaping (CLLocation) -> Void, errorHandler: @escaping (Error) -> Void) {
        let geocoder = CLGeocoder()
        DispatchQueue.global(qos: .userInitiated).async {
            // Implement local search by name
            geocoder.geocodeAddressString(textFieldString){(placemarks, error) -> Void in
                DispatchQueue.main.async {
                    if let placemark = placemarks?.first, let locationCoordinates = placemark.location  {
                        completionHandler(locationCoordinates)
                    } else if let error = error {
                        errorHandler(error)
                    }
                }
            }
        }
    }
}
