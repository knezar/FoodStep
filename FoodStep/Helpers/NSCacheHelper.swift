//
//  NSCacheHelper.swift
//  FoodStep
//
//  Created by C4Q on 12/8/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import UIKit

class NSCacheHelper {
    private init() {}
    static let manager = NSCacheHelper()
    private var myCache = NSCache<NSString, UIImage>()
    func addImage(with imageID: String, and image: UIImage) {
        
        myCache.setObject(image, forKey: imageID as NSString)
    }
    func getImage(with imageID: String) -> UIImage? {
        return myCache.object(forKey: imageID as NSString)
    }
}
