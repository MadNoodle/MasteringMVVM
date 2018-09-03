
//
//  WeatherDAyRepresentable.swift
//  Cloudy
//
//  Created by Mathieu Janneau on 31/08/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

protocol WeatherDayRepresentable {
  var day: String { get}
  var time: String { get}
  var temperature: String { get}
  var windSpeed: String { get}
  var image: UIImage? { get}
}
