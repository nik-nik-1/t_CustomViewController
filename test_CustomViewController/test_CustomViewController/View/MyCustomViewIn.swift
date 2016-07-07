//
//  MyCustomViewIn.swift
//  test_CustomViewController
//
//  Created by Admin on 29.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

@IBDesignable class MyCustomViewIn: UIView {

	// MARK: Initialization
	var view: UIView!
	var nibName: String = "MyCustomViewIn"

	@IBOutlet weak var searchTextInput: UITextField!
	@IBOutlet weak var searchButton: UIButton!

	override init (frame: CGRect) {

		super.init(frame: frame)
		setup()
	}


	required init(coder aDecoder: NSCoder) {

		super.init(coder: aDecoder)!
		setup()

	}

	func setup () {
		view = loadViewFromNib()

		view.frame = bounds
		view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]

		addSubview(view)
	}

	func loadViewFromNib () -> UIView {

		let bundle = NSBundle(forClass: self.dynamicType)
		let nib = UINib(nibName: nibName, bundle: bundle)
		let view = nib.instantiateWithOwner(self, options: nil)[0] as? UIView

		return view!
	}

}
