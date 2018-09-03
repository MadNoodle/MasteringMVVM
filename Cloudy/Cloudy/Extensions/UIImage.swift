//
//  UIImage.swift
//  Cloudy
//
//  Created by Mathieu Janneau on 29/08/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
  
  class func imageForIcon(withName name: String) -> UIImage? {
    
    switch name {
    case "clear-day", "clear-night", "rain", "snow", "sleet":
      return UIImage(named: name)
    case "wind", "cloudy", "partly-cloudy-day", "partly-cloudy-night":
      return UIImage(named: "cloudy")
    default: return UIImage(named: "clear-day")
    }
    
  }
}
