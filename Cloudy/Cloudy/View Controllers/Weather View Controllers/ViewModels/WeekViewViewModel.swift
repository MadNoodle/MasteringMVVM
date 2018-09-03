//
//  WeekViewViewModel.swift
//  Cloudy
//
//  Created by Mathieu Janneau on 30/08/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import Foundation
import UIKit

struct WeekViewViewModel {
  // MARK: - PROPERTIES
  let weatherData: [WeatherDayData]
  private let dateFormatter = DateFormatter()
  private let dayFormatter = DateFormatter()
  
  var numberOfSection: Int {
    return 1
  }
  
  var numberOfDays: Int {
    return weatherData.count
  }
  
  // MARK: -METHODS
  
  func viewModel(for index: Int) -> WeatherDayViewViewModel {
    return WeatherDayViewViewModel(weatherData: weatherData[index])
  }
  
  func day(for index: Int) -> String {
    let weatherDayData = weatherData[index]
    dateFormatter.dateFormat = "EEEE"
    return dateFormatter.string(from: weatherDayData.time)
  }
  
  func date(for index: Int) -> String {
    let weatherDayData = weatherData[index]
    dateFormatter.dateFormat = "MMMM d"
    return dateFormatter.string(from: weatherDayData.time)
  }
  
  func temperature(for index: Int) -> String {
     let weatherDayData = weatherData[index]
      let min = format(temperature:weatherDayData.temperatureMin)
     let max = format(temperature: weatherDayData.temperatureMax)
    return " \(min) - \(max)"
  }
  
  func format(temperature: Double) -> String{
    switch UserDefaults.temperatureNotation(){
    case .fahrenheit:
      return String(format: "%.0f °F", temperature)
    case .celsius:
      return String(format: "%.0f °C", temperature.toCelcius())
    }
  }
  
  func windSpeed(for index: Int) -> String {
    let weatherDayData = weatherData[index]
    let speed = weatherDayData.windSpeed
    
    switch UserDefaults.unitsNotation(){
    case .imperial:
      return String(format: "%.f MPH", speed)
    case .metric:
      return String(format: "%.f KPH", speed.toKPH())
    }
  }
  
  func image(for index: Int) -> UIImage? {
    let weatherDayData = weatherData[index]
    return UIImage.imageForIcon(withName: weatherDayData.icon)
  }
}
