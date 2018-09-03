//
//  SettingsViewTimeViewModelTests.swift
//  CloudyTests
//
//  Created by Mathieu Janneau on 31/08/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsViewTimeViewModelTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    
  }
  
  override func tearDown() {    
    super.tearDown()
    UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.timeNotation)
  }
  
  func testText_twelveHour() {
    let viewModel = SettingsViewTimeViewModel(timeNotation: .twelveHour)
    XCTAssertEqual(viewModel.text, "12 Hours")
  }
  
  func testText_twentyFourHour() {
    let viewModel = SettingsViewTimeViewModel(timeNotation: .twentyFourHour)
    XCTAssertEqual(viewModel.text, "24 Hours")
  }
  
  func testAccessoryType_twelveHour_twelveHour() {
    let timeNotation: TimeNotation = .twelveHour
    UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
    let viewModel = SettingsViewTimeViewModel(timeNotation: .twelveHour)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
  }
  
  func testAccessoryType_twelveHour_twentyFourHour() {
    let timeNotation: TimeNotation = .twentyFourHour
    UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
    let viewModel = SettingsViewTimeViewModel(timeNotation: .twelveHour)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
  }
  
  func testAccessoryType_twentyFourHour_twelveHour() {
    let timeNotation: TimeNotation = .twelveHour
    UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
    let viewModel = SettingsViewTimeViewModel(timeNotation: .twentyFourHour)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
  }
  
  func testAccessoryType_twentyFourHour_twentyFourHour() {
    let timeNotation: TimeNotation = .twentyFourHour
    UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
    let viewModel = SettingsViewTimeViewModel(timeNotation: .twentyFourHour)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
  }
}
