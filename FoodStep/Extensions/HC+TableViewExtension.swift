//
//  HC+TableViewExtension.swift
//  FoodStep
//
//  Created by C4Q on 12/15/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//
import UIKit

extension HomeController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == searchView.termTextField {
            searchCompleter.filterType = .locationsOnly
            searchCompleter.queryFragment = termTextField.text!
        }
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        searchResults = []
    }
    
}

extension HomeController: MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        let charset = CharacterSet(charactersIn: "1234567890")
        searchResults = completer.results.filter({!$0.title.contains("1234")})
        //        print(searchResults.first)
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        // handle error
    }
}

extension SearchView: UITableViewDataSource {
    
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

extension SearchView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let completion = searchResults[indexPath.row]
        let searchRequest = MKLocalSearch.Request(completion: completion)
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            if let coordinate = response?.mapItems[0].placemark.coordinate{
                self.homeVC.loadManualSearchData(coordinates: coordinate)
                
                //                self.homeVC.handleProfile()
                //                ClientAPI.manager.getWeather(from: (coordinate.latitude, coordinate.longitude), completionHandler: {(data) in
                //                    self.homeVC.venueData = data
                //
                //                    NotificationCenter.default.post(name: NSNotification.Name("load"), object: nil)
                //
                //                    self.handleBackButton()
                //                }, errorHandler: {print($0)})
            }
            
        }
    }
}

