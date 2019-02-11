////
////  SearchView.swift
////  FoodStep
////
////  Created by C4Q on 12/11/18.
////  Copyright © 2018 FoodStepProject. All rights reserved.
////
//
//import UIKit
//import MapKit
//
//class SearchView: UIView {
//
//    lazy var topStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [termTextField])
//        stackView.axis = .horizontal
//        stackView.spacing = 5
//        stackView.distribution = .fillProportionally
//        return stackView
//    }()
//
//    
//    override init(frame: CGRect){
//        super.init(frame: frame)
//        setupButtons()
//        setupViews()
//        searchCompleter.delegate = self
//        termTextField.delegate = self
//        tableView.delegate = self
//        tableView.dataSource = self
//        cityTextField.delegate = self
//    }
//    
//    @objc func handleMarker() {
//        
//    }
//    @objc func handleBackButton() {
//        
//    }
//    private func setupViews(){
//        addSubview(cityTextField)
//        cityTextField.translatesAutoresizingMaskIntoConstraints = false
//        cityTextField.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 3).isActive = true
//        cityTextField.widthAnchor.constraint(equalTo: termTextField.widthAnchor).isActive = true
//        cityTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
//        cityTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
//        
//        addSubview(tableView)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 5).isActive = true
//        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//    }
//    
//    //    @IBAction textFieldEditingDidChange(- sender: Any) {
//    //
//    //    }
//
//    
//    
//    
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//
