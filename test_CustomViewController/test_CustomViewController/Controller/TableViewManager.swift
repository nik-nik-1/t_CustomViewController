//
//  TableViewMfnager.swift
//  test_CustomViewController
//
//  Created by Admin on 30.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class TableViewManager: NSObject {
  
  func getMassForTableView() -> [String] {
    let swiftBlogs = ["Ray Wenderlich", "NSHipster", "iOS Developer Tips", "Jameson Quave", "Natasha The Robot", "Coding Explorer", "That Thing In Swift", "Andrew Bancroft", "iAchieved.it", "Airspeed Velocity"]
    
    return swiftBlogs
  }
  
  func getStructForTableView() -> [Blog] {
    
    let swiftBlogs = [
      Blog(category:"1", name:"Ray Wenderlich"),
      Blog(category:"2", name:"NSHipster"),
      Blog(category:"1", name:"iOS Developer Tips"),
      Blog(category:"2", name:"Jameson Quave"),
      Blog(category:"3", name:"Natasha The Robot"),
      Blog(category:"1", name:"Coding Explorer"),
      Blog(category:"3", name:"That Thing In Swift"),
      Blog(category:"1", name:"Andrew Bancroft"),
      Blog(category:"3", name:"iAchieved.it"),
      Blog(category:"1", name:"Airspeed Velocity")]
    
    return swiftBlogs
  }
  
}
