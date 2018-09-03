//
//  SettingsViewTemperatureViewModelTests.swift
//  CloudyTests
//
//  Created by Mathieu Janneau on 02/09/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsViewTemperatureViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        super.tearDown()
      UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
    }
  
  func testText_fahrenheit(){
    let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: .fahrenheit)
    XCTAssertEqual(viewModel.text, "°F")
  }
  func testText_celcius(){
    let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: .celsius)
    XCTAssertEqual(viewModel.text, "°C")
  }
  
  
  func testAccessoryView_fahrenheit_fahrenheit(){
    let temperatureNotation: TemperatureNotation = .fahrenheit
    UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
    
    let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: .fahrenheit)
    
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
  }
  
   func testAccessoryView_fahrenheit_celsius(){
    let temperatureNotation: TemperatureNotation = .fahrenheit
    UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
    let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: .celsius)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
  }
  
  func testAccessoryView_celsius_celsius(){
    let temperatureNotation: TemperatureNotation = .celsius
    UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
    
    let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: .celsius)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
  }
  
  func testAccessoryView_celsius_fahrenheit(){
    let temperatureNotation: TemperatureNotation = .celsius
    UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
    
    let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: .fahrenheit)
    
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
    
  }
    

    
}
