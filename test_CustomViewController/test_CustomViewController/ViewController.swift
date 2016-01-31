//
//  ViewController.swift
//  test_CustomViewController
//
//  Created by Admin on 28.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var InputTextController: MyCustomViewIn!
  
  @IBOutlet var MyTableView: UITableView!
  
  // MARK: - Properties
  //let swiftBlogs = TableViewManager().getStructForTableView()
  
  
  let swiftBlogs = TableViewManager().getStructForTableView()//[Blog]()
  var filteredBlogs = [Blog]()
  let searchController = UISearchController(searchResultsController: nil)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    MyTableView.delegate    = self
    MyTableView.dataSource  = self
    
    //InputTextController.SearchButton.addTarget(self, action: "myButtonTapped2:", forControlEvents: UIControlEvents.TouchUpInside)
    InputTextController.SearchButton.addTarget(self, action: Selector("myButtonTapped2:"), forControlEvents: UIControlEvents.TouchUpInside)
    
    // Setup the Search Controller
    searchController.searchResultsUpdater = self
    searchController.searchBar.delegate = self
    definesPresentationContext = true
    searchController.dimsBackgroundDuringPresentation = false

  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  func myButtonTapped2(sender:UIButton!)
  {
    print("Custom subview button 2 tapped")
  }

}


// MARK: extentions
extension ViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    /*if let albumData = currentAlbumData {
    return albumData.titles.count
    } else {
    return 0
    }*/
    //return swiftBlogs.count
    
    if searchController.active && searchController.searchBar.text != "" {
      return filteredBlogs.count
    }
    return swiftBlogs.count
    
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
  
    
    /*let cell = tableView.dequeueReusableCellWithIdentifier("TextCell", forIndexPath: indexPath) as UITableViewCell
    
    let row = indexPath.row
    cell.textLabel?.text = swiftBlogs[row]
    
    return cell*/
    let cell = tableView.dequeueReusableCellWithIdentifier("TextCell", forIndexPath: indexPath)
    let blog: Blog
    if searchController.active && searchController.searchBar.text != "" {
      blog = filteredBlogs[indexPath.row]
    } else {
      blog = swiftBlogs[indexPath.row]
    }
    cell.textLabel!.text = blog.name
    //cell.detailTextLabel!.text = blog.category
    return cell
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1 // This was put in mainly for my own unit testing
  }
  
  func filterContentForSearchText(searchText: String, scope: String = "All") {
    filteredBlogs = swiftBlogs.filter({( blog : Blog) -> Bool in
      let categoryMatch = (scope == "All") || (blog.category == scope)
      return categoryMatch && blog.name.lowercaseString.containsString(searchText.lowercaseString)
    })
    MyTableView.reloadData()
  }
  
}

extension ViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
    let row = indexPath.row
    print(swiftBlogs[row])
  }
}

extension ViewController: UISearchBarDelegate {
  // MARK: - UISearchBar Delegate
  func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    filterContentForSearchText(searchBar.text!)
  }
}

extension ViewController: UISearchResultsUpdating {
  // MARK: - UISearchResultsUpdating Delegate
  func updateSearchResultsForSearchController(searchController: UISearchController) {
    let searchBar = searchController.searchBar
    //let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
    filterContentForSearchText(searchController.searchBar.text!)
  }
}


