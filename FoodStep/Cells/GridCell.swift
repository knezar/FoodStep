//
//  rightGridCell.swift
//  FoodStep
//
//  Created by C4Q on 12/4/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import UIKit

class GridCell: UICollectionViewCell {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    let thumbnailImageView: UIImageView = {
      
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "foodLandscaped")
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 15)
//        label.setContentHuggingPriority(UILayoutPriority, for: <#T##NSLayoutConstraint.Axis#>)
        label.text = "Restaurant Title"
        return label
    }()
    
    let discriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        label.text = "some restaurnat discription here just enter it some restaurnat discription here just enter it some restaurnat discription    here just enter it"
        return label
    }()
    
    let distanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "1.2 miles"
        return label
    }()
    let commentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "speech-bubble-32")
        return imageView
    }()
    
    let likedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "heart-outline-32")
        return imageView
    }()
    
    let bookmarkedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "bookmark-32")
        return imageView
    }()
    
    lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [distanceLabel, commentImageView, likedImageView, bookmarkedImageView])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    
    
    func setupViews() {
        backgroundColor = UIColor.white
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        addSubview(titleLabel)
        addSubview(thumbnailImageView)
        addSubview(discriptionLabel)
        addSubview(bottomStackView)
        subViewConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func subViewConstraints() {
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        thumbnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1/(thumbnailImageView.image?.getCropRatio())!).isActive = true
        thumbnailImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
        discriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        discriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        discriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        discriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        
        commentImageView.translatesAutoresizingMaskIntoConstraints = false
        commentImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        commentImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        likedImageView.translatesAutoresizingMaskIntoConstraints = false
        likedImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        likedImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        bookmarkedImageView.translatesAutoresizingMaskIntoConstraints = false
        bookmarkedImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: 5).isActive = true
        bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        bottomStackView.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
}

