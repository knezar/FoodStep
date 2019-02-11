//
//  SearchViewController.swift
//  FoodStep
//
//  Created by C4Q on 12/26/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import UIKit
import MapKit

protocol MyProtocol: NSObjectProtocol {
    func getLocationFromSearchController(location: (Double, Double))
}

class SearchViewController: UIViewController {
//    let feedCell = FeedCell()
    weak var delegate: MyProtocol?
    let graphicHelper = GraphicHelper()
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()  {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    lazy var topStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [termTextField])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        return stackView
    }()
    let termTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.tag = 0
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let cityTextField: UITextField = {
        let tf = UITextField()
        tf.tag = 1
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let tableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.getRGB(red: 45, green: 119, blue: 135)
        
        setupViews()
        setupButtons()
        searchCompleter.delegate = self
        termTextField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        cityTextField.delegate = self
        
    }
    @objc func handleBackButton() {
        dismiss(animated: true, completion: nil)
//        present(HomeController(), animated: true, completion: nil)
    }
 
    func setupButtons() {
        let backButton = graphicHelper.setNavBarImages(image: #imageLiteral(resourceName: "372909-48"), width: 30)
        backButton.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        topStackView.insertArrangedSubview(backButton, at: 0)
    }
    
    func setupViews(){
        view.addSubview(topStackView)
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        topStackView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        view.addSubview(cityTextField)
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        cityTextField.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 3).isActive = true
        cityTextField.widthAnchor.constraint(equalTo: termTextField.widthAnchor).isActive = true
        cityTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        cityTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 5).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}
extension SearchViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == termTextField {
            searchCompleter.filterType = .locationsOnly
            searchCompleter.queryFragment = termTextField.text!
        }
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        searchResults = []
    }
    
}

extension SearchViewController: MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        //        let charset = CharacterSet(charactersIn: "1234567890")
        searchResults = completer.results.filter({!$0.title.contains("1234")})
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        // handle error
    }
}

extension SearchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchResult = searchResults[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.subtitle
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let completion = searchResults[indexPath.row]
        let searchRequest = MKLocalSearch.Request(completion: completion)
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            if let coordinate = response?.mapItems[0].placemark.coordinate{
                
                self.delegate?.getLocationFromSearchController(location: (coordinate.latitude, coordinate.longitude))
//                ClientAPI.manager.getVenueData(from: (coordinate.latitude, coordinate.longitude), completionHandler: {(onlineData) in
//                    self.feedCell.venueData = onlineData
//                    self.feedCell.cellCollectionView.reloadData()
//                }, errorHandler: {print($0)})
                self.handleBackButton()
            }
            
        }
    }
}
