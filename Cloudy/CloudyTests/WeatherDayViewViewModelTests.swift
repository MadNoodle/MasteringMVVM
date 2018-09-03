//
//  WeatherDayViewViewModelTests.swift
//  CloudyTests
//
//  Created by Mathieu Janneau on 03/09/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy


class WeatherDayViewViewModelTests: XCTestCase {
  
  var viewModel: WeatherDayViewViewModel!
    override func setUp() {
        super.setUp()
      let data = loadStubFromBundle(withName: "darkSky", forExtension: "json")
      let weatherData: WeatherData = try! JSONDecoder.decode(data: data)
      viewModel = WeatherDayViewViewModel(weatherData: weatherData.dailyData[5])
    }
    
    override func tearDown() {
        super.tearDown()
      UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
      UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.timeNotation)
      UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
    }

  func testDay() {
  XCTAssertEqual(viewModel.day, "Friday")
  }
  
  func testDate() {
    XCTAssertEqual(viewModel.time, "September 7")
  }
  
  func testTemperature_fahrenheit() {
    let temperatureNotation: TemperatureNotation = .fahrenheit
    UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
    XCTAssertEqual(viewModel.temperature, "57 °F - 73 °F")
  }
  
  func testTemperature_celsius() {
    let temperatureNotation: TemperatureNotation = .celsius
    UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
    XCTAssertEqual(viewModel.temperature, "14 °C - 23 °C")
  }
  
  func testWindSpeed_imperial() {
    let unitsNotation: UnitsNotation = .imperial
    UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
  XCTAssertEqual(viewModel.windSpeed, "5 MPH")
  }
  func testWindSpeed_metric() {
    let unitsNotation: UnitsNotation = .metric
    UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
    XCTAssertEqual(viewModel.windSpeed, "7 KPH")
  }
  
 func testImage() {
 let viewModelImage = viewModel.image
let imageDataViewModel = UIImagePNGRepresentation(viewModelImage!)!
let imageDataReference = UIImagePNGRepresentation(UIImage(named:"clear-day")!)!
XCTAssertNotNil(viewModelImage)
XCTAssertEqual(viewModelImage!.size.width, 236.0)

XCTAssertEqual(imageDataViewModel, imageDataReference)
  }
}
