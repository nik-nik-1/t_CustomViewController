//
//  ViewController.swift
//  test_CustomViewController
//
//  Created by Admin on 28.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var MyTableView: UITableView!
  let swiftBlogs = TableViewManager().getMassForTableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    MyTableView.delegate    = self
    MyTableView.dataSource  = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

extension ViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    /*if let albumData = currentAlbumData {
    return albumData.titles.count
    } else {
    return 0
    }*/
    return swiftBlogs.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    /*let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
    if let albumData = currentAlbumData {
    cell.textLabel!.text        = albumData.titles[indexPath.row]
    cell.detailTextLabel!.text  = albumData.values[indexPath.row]
    }
    return cell*/
    
    let cell = tableView.dequeueReusableCellWithIdentifier("TextCell", forIndexPath: indexPath) as UITableViewCell
    
    let row = indexPath.row
    cell.textLabel?.text = swiftBlogs[row]
    
    return cell
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1 // This was put in mainly for my own unit testing
  }
  
}

extension ViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
    let row = indexPath.row
    print(swiftBlogs[row])
  }
}




