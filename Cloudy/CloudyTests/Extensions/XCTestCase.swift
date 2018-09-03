//
//  XCTestCase.swift
//  CloudyTests
//
//  Created by Mathieu Janneau on 02/09/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
  
  func loadStubFromBundle(withName name : String, forExtension suffix: String) -> Data {
    let bundle = Bundle(for: classForCoder)
    let url = bundle.url(forResource: name, withExtension: suffix)
    return try! Data(contentsOf: url!)
  }
}
