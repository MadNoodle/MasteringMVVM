//
//  WeekViewViewModelTests.swift
//  CloudyTests
//
//  Created by Mathieu Janneau on 03/09/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class WeekViewViewModelTests: XCTestCase {
  
  var viewModel: WeekViewViewModel!
  
    override func setUp() {
        super.setUp()
      let data = loadStubFromBundle(withName: "darkSky", forExtension: "json")
      let weatherData: WeatherData = try! JSONDecoder.decode(data: data)
      viewModel = WeekViewViewModel(weatherData: weatherData.dailyData)
      
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
      UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
      UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.timeNotation)
      UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
    }
    
  func testNumberOfSection() {
    let sections = viewModel.numberOfSection
    XCTAssertEqual(sections, 1)
  }
  
  func testNumberOfDays() {
    let days = viewModel.numberOfDays
    XCTAssertEqual(days, 8)
  }
  
  func testViewModelforDay() {
    let weekViewModel = viewModel.viewModel(for: 5)
    XCTAssertEqual(weekViewModel.day, "Friday")
    print(weekViewModel.time)
    XCTAssertEqual(weekViewModel.time, "September 7")
  }
  
}
