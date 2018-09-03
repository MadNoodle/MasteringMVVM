//
//  WeatherDayViewViewModel.swift
//  Cloudy
//
//  Created by Mathieu Janneau on 31/08/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import Foundation
import UIKit

struct WeatherDayViewViewModel: WeatherDayRepresentable {
  
  let weatherData: WeatherDayData
  
  private let dayFormatter = DateFormatter()
  private let dateFormatter = DateFormatter()
  
  var day: String {
    dateFormatter.dateFormat = "EEEE"
    return dateFormatter.string(from: weatherData.time)
  }
  
  var time: String {
    dateFormatter.dateFormat = "MMMM d"
    return dateFormatter.string(from: weatherData.time)
  }
  
  var temperature: String {
    let min = format(temperature: weatherData.temperatureMin)
    let max = format(temperature: weatherData.temperatureMax)
    return "\(min) - \(max)"
  }
  
  var windSpeed: String {
    let speed = weatherData.windSpeed
    
    switch  UserDefaults.unitsNotation() {
    case .imperial:
      return String(format: "%.0f MPH", speed)
    case .metric:
      return String(format: "%.0f KPH", speed.toKPH())
    }
  }
  
  var image: UIImage? {
    return UIImage.imageForIcon(withName: weatherData.icon)
  }
  func format(temperature: Double) -> String {
    switch UserDefaults.temperatureNotation() {
    case .fahrenheit:
      return String(format: "%.0f °F", temperature)
    case .celsius:
      return String(format: "%.0f °C", temperature.toCelcius())
  }
}
}
