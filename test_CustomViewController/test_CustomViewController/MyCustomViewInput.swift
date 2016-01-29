//
//  myCustomView_input.swift
//  test_CustomViewController
//
//  Created by Admin on 28.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

@IBDesignable class MyCustomViewInput: UIView {
  
  /*
  // Only override drawRect: if you perform custom drawing.
  // An empty implementation adversely affects performance during animation.
  override func drawRect(rect: CGRect) {
  // Drawing code
  }
  */
  
 
  @IBOutlet var myCustomInput: UITextField!
  
  @IBAction func myCustomInputOKButton(sender: AnyObject) {
  }
 
  
  var view:UIView!
  
  /*@IBInspectable
  var mytitleLabelText: String? {
    get {
      return titleLabel.text
    }
    set(mytitleLabelText) {
      titleLabel.text = mytitleLabelText
    }
  }
  
  @IBInspectable
  var myCustomImage:UIImage? {
    get {
      return myImage.image
    }
    set(myCustomImage) {
      myImage.image = myCustomImage
    }
  }
  */
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    setup()
  }
  
  func setup() {
    view = loadViewFromNib()
    view.frame = bounds
    //view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeightaddSubview(view)
    view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
  }
  
  func loadViewFromNib() -> UIView {
    let bundle  = NSBundle(forClass:self.dynamicType)
    let nib     = UINib(nibName: "MyCustomViewInput", bundle: bundle)
    let view    = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
    
    return view
  }
  
}
