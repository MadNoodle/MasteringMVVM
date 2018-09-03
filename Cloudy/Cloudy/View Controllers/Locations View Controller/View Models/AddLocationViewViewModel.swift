//
//  AddLocationViewViewModel.swift
//  Cloudy
//
//  Created by Mathieu Janneau on 03/09/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import Foundation
import CoreLocation

class AddLocationViewViewModel {
  
  // MARK: - PROPERTIES
  var query: String = "" {
    didSet {
      geocode(addressString:query)
    }
  }
  
  // Closures for binding to controller
  var queryingDidChange:((Bool) -> ())?
  var locationsDidChange:(([Location]) -> ())?
  
  private var querying: Bool = false {
    didSet {
      queryingDidChange?(querying)
    }
  }
  
  private var locations: [Location] = [] {
    didSet {
      locationsDidChange?(locations)
    }
  }
  
  var hasLocation: Bool {
    return numberOfLocations > 0
  }
  
  var numberOfLocations: Int {
    return locations.count
  }
  
  // MARK: -
  private lazy var geocoder = CLGeocoder()
  
  
  func location(at index: Int) -> Location? {
    guard index < locations.count else {return nil}
    return locations [index]
  }
  
  func viewModelForLocation(at index: Int) -> LocationRepresentable? {
     guard let location = location(at: index) else {return nil}
    return LocationsViewLocationViewModel(location: location.location , locationAsString: location.name)
  }
  
  private func geocode(addressString: String?) {
    guard let addressString = addressString, !addressString.isEmpty
      else {
      locations = []
      return}
    querying = true
    
    geocoder.geocodeAddressString(addressString) { [weak self] (placemarks, error) in
      var locations: [Location] = []
      self?.querying = false
      
      if error != nil {
        print(error?.localizedDescription)
      }
      if let _placemarks = placemarks {
        locations = _placemarks.compactMap({ (placemark) -> Location? in
          guard let name = placemark.name else { return nil }
          guard let location = placemark.location else { return nil}
          return Location(name: name, latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        })
      }
      self?.locations = locations
      
    }
  }
}
