//
//  ClientAPI.swift
//  FoodStep
//
//  Created by C4Q on 12/7/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import Foundation
import UIKit

struct ClientAPI {
    private init() {}
    static let manager = ClientAPI()
    private let clientId = "ZZJ2FVNSUIYFE0JRYIC3NC4LPIDXDH4NDEVJMIYEEEFTS5FU"
    private let clientPWD = "NVJZVASZSXX3EHJHYPIIB5UVUUJZRX1GGXIQRTPJOQTRGSKB"
    //    private let keyAPI = "8857274-36307e4ac20455ab80ff6533a"
    func getVenueData(from geoPosition: (Double, Double),
                    completionHandler: @escaping ([Venue]) -> Void,
                    errorHandler: @escaping (AppError) -> Void) {
        
        let fourSquareUrl = "https://api.foursquare.com/v2/venues/search?ll=\(geoPosition.0),\(geoPosition.1)&query=cafe&client_id=\(clientId)&client_secret=\(clientPWD)&v=20181208"
        guard let url = URL(string: fourSquareUrl) else {return}
        let parseData = {(data: Data) in
            do {
                let onlineInfo = try JSONDecoder().decode(FSLocations.self, from: data)
                completionHandler(onlineInfo.response.venues)
            }
            catch let error {
                errorHandler(AppError.couldNotParseJSON(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: parseData, errorHandler: errorHandler)
    }
    
    
    func getTrendingVenueData(from geoPosition: (Double, Double),
                      completionHandler: @escaping ([Venue]) -> Void,
                      errorHandler: @escaping (AppError) -> Void) {
        
        let fourSquareUrl = "https://api.foursquare.com/v2/venues/search?ll=\(geoPosition.0),\(geoPosition.1)&query=cafe&client_id=\(clientId)&client_secret=\(clientPWD)&v=20181208"
        guard let url = URL(string: fourSquareUrl) else {return}
        let parseData = {(data: Data) in
            do {
                let onlineInfo = try JSONDecoder().decode(FSLocations.self, from: data)
                completionHandler(onlineInfo.response.venues)
            }
            catch let error {
                errorHandler(AppError.couldNotParseJSON(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: parseData, errorHandler: errorHandler)
    }
    
    
//    func getImageStrings(venueID: String,
//                    errorHandler: @escaping (AppError) -> Void) {
//
//        let imageURL = "https://api.foursquare.com/v2/venues/\(venueID)/photos?client_id=\(clientId)&client_secret=\(clientPWD)&v=20181208"
//            guard let url = URL(string: imageURL) else {return}
//        let parseDataWeather = {(data: Data) in
//            do {
//                let onlineInfo = try JSONDecoder().decode(ImageIRes.self, from: data)
//                if let getImageString = onlineInfo.response.photos.items.first {
//                    guard let url = URL(string: "\(getImageString.prefix)100x133\(getImageString.suffix)") else {return}
//                        do {
//                        let dataImg = try Data.init(contentsOf: url)
//                        if let myImage = UIImage(data: dataImg) {
//                            NSCacheHelper.manager.addImage(with: venueID, and: myImage)
//                        }
//                    }
//                }
//                else {
//                    errorHandler(.noDataReceived)
//                    print("saywhat")
//                    return
//                }
//            }
//            catch let error {
//                print("quota reached")
//                errorHandler(AppError.couldNotParseJSON(rawError: error))
//            }
//        }
//        NetworkHelper.manager.performDataTask(with: url, completionHandler: parseDataWeather, errorHandler: errorHandler)
//    }
}

