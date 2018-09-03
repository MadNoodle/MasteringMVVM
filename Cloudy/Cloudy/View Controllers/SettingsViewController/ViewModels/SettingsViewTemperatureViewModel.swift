//
//  SettingsViewTemperatureViewModel.swift
//  Cloudy
//
//  Created by Mathieu Janneau on 30/08/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//
import UIKit

struct SettingsViewTemperatureViewModel {
  
  // MARK: -PROPERTIES
  
  let temperatureNotation: TemperatureNotation
  
}

extension SettingsViewTemperatureViewModel: SettingsRepresentable {
  var text: String {
    switch temperatureNotation {
    case .fahrenheit:
      return "°F"
    case .celsius:
      return "°C"
    }
  }
  
  var accessoryType: UITableViewCellAccessoryType {
    if UserDefaults.temperatureNotation() == temperatureNotation {
      return .checkmark
    }
    else {
      return .none
    }
  }
}
