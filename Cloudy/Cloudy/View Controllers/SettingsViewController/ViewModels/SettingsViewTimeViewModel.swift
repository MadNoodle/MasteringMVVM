//
//  SettingsViewTimeViewModel.swift
//  Cloudy
//
//  Created by Mathieu Janneau on 30/08/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewTimeViewModel {
  
  // MARK: -PROPERTIES
  
  let timeNotation: TimeNotation

}

extension SettingsViewTimeViewModel: SettingsRepresentable {
  
  var text: String {
    switch timeNotation {
    case .twelveHour:
      return "12 Hours"
    case .twentyFourHour:
      return "24 Hours"
    }
  }
  
  var accessoryType: UITableViewCellAccessoryType {
    if UserDefaults.timeNotation() == timeNotation {
      return .checkmark
    }
    else {
      return .none
    }
  }

}
