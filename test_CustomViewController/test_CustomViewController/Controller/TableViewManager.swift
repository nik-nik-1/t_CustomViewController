//
//  TableViewMfnager.swift
//  test_CustomViewController
//
//  Created by Admin on 30.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class TableViewManager: NSObject {

	private let swiftBlogs = ["Ray Wenderlich",
	                  "NSHipster",
	                  "iOS Developer Tips",
	                  "Jameson Quave",
	                  "Natasha The Robot",
	                  "Coding Explorer",
	                  "That Thing In Swift",
	                  "Andrew Bancroft",
	                  "iAchieved.it",
	                  "Airspeed Velocity"]

	func getMassForTableView() -> [String] {

		return swiftBlogs

	}

	func getStructForTableView() -> [Blog] {

		let swiftBlogsStruct = [
			Blog(category:"1", name: swiftBlogs[0]),
			Blog(category:"2", name: swiftBlogs[1]),
			Blog(category:"1", name: swiftBlogs[2]),
			Blog(category:"2", name: swiftBlogs[3]),
			Blog(category:"3", name: swiftBlogs[4]),
			Blog(category:"1", name: swiftBlogs[5]),
			Blog(category:"3", name: swiftBlogs[6]),
			Blog(category:"1", name: swiftBlogs[7]),
			Blog(category:"3", name: swiftBlogs[8]),
			Blog(category:"1", name: swiftBlogs[9])
		]

		return swiftBlogsStruct
	}

}
