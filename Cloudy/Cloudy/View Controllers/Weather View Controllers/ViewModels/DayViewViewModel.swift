//
//  DayViewControllerViewModel.swift
//  Cloudy
//
//  Created by Mathieu Janneau on 29/08/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import Foundation
import UIKit

struct DayViewViewModel {
  let weather: WeatherData
  
  private let dateFormatter = DateFormatter()
  private let timeFormatter = DateFormatter()
 
  // Formatted date
  var date: String {
 
    //Configure format
    dateFormatter.dateFormat = "EE, MMMM d"
    
    return dateFormatter.string(from: weather.time)
  }
  
  // Formatted time
  var time: String {
    //Configure format
    timeFormatter.dateFormat = UserDefaults.timeNotation().timeFormat
    
    return timeFormatter.string(from: weather.time)
  }
  
  var summary: String {
    return weather.summary
  }
  
  var temperature: String {
    let temperature = weather.temperature
    // Return according to user's prefs
    switch UserDefaults.temperatureNotation() {
    case .celsius:
      return String(format: "%.1f °C", temperature.toCelcius())
    case .fahrenheit:
      return String(format: "%.1f °F", temperature)
    }
  }
  
  var windSpeed: String {
    let speed = weather.windSpeed
    
    switch UserDefaults.unitsNotation(){
    case .imperial:
      return String(format: "%.f MPH", speed )
    case .metric:
      return String(format: "%.f KPH", speed.toKPH() )      
    }
  }
  
  var image: UIImage? {
    return UIImage.imageForIcon(withName: weather.icon)
  }
  
}
