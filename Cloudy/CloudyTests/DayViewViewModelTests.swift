//
//  DayViewViewModelTests.swift
//  CloudyTests
//
//  Created by Mathieu Janneau on 02/09/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class DayViewViewModelTests: XCTestCase {
  
  var viewModel: DayViewViewModel!
    override func setUp() {
        super.setUp()
      let stub = loadStubFromBundle(withName: "darkSky", forExtension: "json")
      let weatherData: WeatherData = try! JSONDecoder.decode(data: stub)
      viewModel = DayViewViewModel(weather: weatherData)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        super.tearDown()
      UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
      UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
      UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.timeNotation)
    }
  
  func testDate() {
   XCTAssertEqual(viewModel.date, "Sun, September 2")
  }
  
  func testTime_twelveHours(){
    let timeNotation: TimeNotation = .twelveHour
    UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
  XCTAssertEqual(viewModel.time, "02:55 PM")
  }
  
  func testTime_twentyFourHours(){
    let timeNotation: TimeNotation = .twentyFourHour
    UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
    print(viewModel.time)
    XCTAssertEqual(viewModel.time, "14:09")
  }
  
  func testSummary() {
    XCTAssertEqual(viewModel.summary, "Partly Cloudy")
  }
  
  func testTemperature_farhenheit(){
    let temperatureNotation: TemperatureNotation = .fahrenheit
    UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
    XCTAssertEqual(viewModel.temperature, "55.8 °F")
  }
  
  func testTemperature_celsius(){
    let temperatureNotation: TemperatureNotation = .celsius
    UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
    XCTAssertEqual(viewModel.temperature, "13.2 °C")
  }
  
  func testWindSpeed_mph() {
    let unitsNotation: UnitsNotation = .imperial
    UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
    print(viewModel.windSpeed)
    XCTAssertEqual(viewModel.windSpeed, "2 MPH")
  }
  
  func testWindSpeed_kph() {
    let unitsNotation: UnitsNotation = .metric
    UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
    print(viewModel.windSpeed)
    XCTAssertEqual(viewModel.windSpeed, "4 KPH")
  }
  func testImage() {
    let viewModelImage = viewModel.image
    let imageDataViewModel = UIImagePNGRepresentation(viewModelImage!)
    
   let refImage = UIImagePNGRepresentation(UIImage(named: "cloudy")!)
    
    XCTAssertNotNil(viewModelImage)
   XCTAssertEqual(viewModelImage!.size.width, 236.0)
    XCTAssertEqual(viewModelImage!.size.height, 172.0)
    XCTAssertEqual(imageDataViewModel, refImage)
  }
}
