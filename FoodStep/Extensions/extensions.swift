//
//  extensions.swift
//  FoodStep
//
//  Created by C4Q on 12/5/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import UIKit

extension UIColor {
    static func getRGB(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIImage {
    func getCropRatio() -> CGFloat {
        let widthRation = CGFloat(self.size.width / self.size.height)
        return widthRation
    }
}
