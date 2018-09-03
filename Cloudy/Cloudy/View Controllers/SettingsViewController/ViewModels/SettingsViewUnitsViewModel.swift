//
//  SettingsViewUnitsViewModel.swift
//  Cloudy
//
//  Created by Mathieu Janneau on 30/08/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewUnitsViewModel {
  
  // MARK: -PROPERTIES
  
  let unitsNotation: UnitsNotation

}

extension SettingsViewUnitsViewModel: SettingsRepresentable {
  
  var text: String {
    switch unitsNotation {
    case .imperial:
      return "Imperial"
    case .metric:
      return "Metric"
    }
  }
  
  var accessoryType: UITableViewCellAccessoryType {
    if UserDefaults.unitsNotation() == unitsNotation {
      return .checkmark
    }
    else {
      return .none
    }
  }

}
