//
//  SettingsViewTimeViewModelTests.swift
//  CloudyTests
//
//  Created by Mathieu Janneau on 31/08/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsViewUnitsViewModelTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    
  }
  
  override func tearDown() {
    super.tearDown()
    UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
  }
  
  func testText_imperial() {
    let viewModel = SettingsViewUnitsViewModel(unitsNotation: .imperial)
    XCTAssertEqual(viewModel.text, "Imperial")
  }
  
  func testText_metric() {
    let viewModel = SettingsViewUnitsViewModel(unitsNotation: .metric)
    XCTAssertEqual(viewModel.text, "Metric")
  }
  
  func testAccessoryType_imperial_imperial() {
    let unitsNotation: UnitsNotation = .imperial
    UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
    let viewModel = SettingsViewUnitsViewModel(unitsNotation: .imperial)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
  }
  
  func testAccessoryType_imperial_metric() {
    let unitsNotation: UnitsNotation = .imperial
    UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
    let viewModel = SettingsViewUnitsViewModel(unitsNotation: .metric)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
  }
  
  func testAccessoryType_metric_metric() {
    let unitsNotation: UnitsNotation = .metric
    UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
    let viewModel = SettingsViewUnitsViewModel(unitsNotation: .metric)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
  }
  
  func testAccessoryType_metric_imperial() {
    let unitsNotation: UnitsNotation = .metric
    UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
    let viewModel = SettingsViewUnitsViewModel(unitsNotation: .imperial)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
  }
}
