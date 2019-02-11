//
//  MapLauncher.swift
//  FoodStep
//
//  Created by C4Q on 12/7/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import UIKit

class GraphicHelper: NSObject {

    override init(){
        super.init()
    }
    let myView = UIView()
    func dimmScreen(view: UIView) -> UIView {
        myView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        view.addSubview(myView)
        myView.frame = view.frame
            myView.alpha = 0
            UIView.animate(withDuration: 0.5) {
                self.myView.alpha = 1
            }
        return myView
    }
    
    func dismissDimmedView () {
        UIView.animate(withDuration: 0.5) {
            self.myView.alpha = 0
        }
    }
    
    func animateMapView(view: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        }, completion: nil)

    }
    func dismissMap (view: UIView) {
        UIView.animate(withDuration: 0.5) {
            view.frame = CGRect(x: 0, y: -view.frame.height, width: view.frame.width, height: view.frame.height)
        }
    }
    
    func setNavBarImages(image: UIImage, width: CGFloat) -> UIButton {
        let imageView = UIImageView()
        if width == CGFloat(35) {
            imageView.contentMode = .scaleAspectFill
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 2
        } else {
            imageView.contentMode = .scaleAspectFit
        }
        imageView.layer.cornerRadius = width/2
        imageView.clipsToBounds = true
        imageView.image = image.withRenderingMode(.alwaysOriginal)
        imageView.isUserInteractionEnabled = false
        let button = UIButton(type: .custom)
        button.adjustsImageWhenHighlighted = true
        button.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return button
    }
}
