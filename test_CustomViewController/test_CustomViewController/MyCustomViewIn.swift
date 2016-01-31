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
  
  @IBOutlet weak var SearchTextInput: UITextField!
  @IBOutlet weak var SearchButton: UIButton!
  
  //func searchButton(sender: AnyObject) {
  //
  //}
  
  /*@IBInspectable var title: String? {
    get {
      return SearchTextInput.text
    }
    set(title) {
      SearchTextInput.text = title
    }
  }
  
  @IBInspectable var buttonTitle: String? {
    get {
      return SearchButton.titleForState(UIControlState.Normal)
    }
    set(title) {
      SearchButton.setTitle(title, forState: UIControlState.Normal)
    }
  }*/
  
  override init(frame: CGRect) {
    // properties
    super.init(frame: frame)
    
    // Set anything that uses the view or visible bounds
    setup()
  }
  
  required init(coder aDecoder: NSCoder) {
    // properties
    super.init(coder: aDecoder)!
    
    // Setup
    setup()
  }
  
  func setup() {
    view = loadViewFromNib()
    
    view.frame = bounds
    view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
    
    addSubview(view)
  }
  
  func loadViewFromNib() -> UIView {
    
    let bundle = NSBundle(forClass: self.dynamicType)
    let nib = UINib(nibName: nibName, bundle: bundle)
    let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
    
    return view
  }
  
  
  
  
  /*
  // Only override drawRect: if you perform custom drawing.
  // An empty implementation adversely affects performance during animation.
  override func drawRect(rect: CGRect) {
  // Drawing code
  }
  */
  
}
