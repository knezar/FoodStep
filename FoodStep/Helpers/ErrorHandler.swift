//
//  ErrorHandler.swift
//  FoodStep
//
//  Created by C4Q on 12/7/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import Foundation

enum AppError: Error {
    case noDataReceived
    case noConnection
    case badStatusCode
    case unKnown(rawError: Error)
    case couldNotParseJSON(rawError: Error)
}
