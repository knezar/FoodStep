//
//  UserDefaultsHelper.swift
//  FoodStep
//
//  Created by C4Q on 12/22/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import Foundation
class UserDefaultsHelper {
    private init() {}
    static let manager = UserDefaultsHelper()
    func save(coordinate: String, nameKey: String) {
        UserDefaults.standard.setValue(coordinate, forKey: nameKey)
    }
    func getLastSearch(nameKey: String) -> String? {
        return UserDefaults.standard.object(forKey: nameKey) as? String
    }
}
