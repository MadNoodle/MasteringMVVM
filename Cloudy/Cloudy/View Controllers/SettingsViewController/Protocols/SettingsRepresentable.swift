//
//  SettingsRepresentable.swift
//  Cloudy
//
//  Created by Mathieu Janneau on 31/08/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

protocol SettingsRepresentable {
  var text: String { get}
  var accessoryType: UITableViewCellAccessoryType { get}
}
