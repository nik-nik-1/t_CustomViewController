//
//  ViewController.swift
//  test_CustomViewController
//
//  Created by Admin on 28.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

	@IBOutlet weak var inputTextController: MyCustomViewIn!
	@IBOutlet weak var myTableView: UITableView!

	// MARK: - Properties

	let swiftBlogs = TableViewManager().getStructForTableView()//[Blog]()
	var filteredBlogs = [Blog]()
	let searchController = UISearchController(searchResultsController: nil)

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		myTableView.delegate    = self
		myTableView.dataSource  = self

		// swiftlint:disable line_length
		inputTextController.searchButton.addTarget(self, action: #selector(SearchViewController.myButtonTapped2(_:)), forControlEvents: UIControlEvents.TouchUpInside)
		// swiftlint:enable line_length

		// Setup the Search Controller
		searchController.searchResultsUpdater = self
		searchController.searchBar.delegate = self
		definesPresentationContext = true
		searchController.dimsBackgroundDuringPresentation = false

		// Setup the Scope Bar
		searchController.searchBar.scopeButtonTitles = ["All", "1", "2", "3"]
		//myTableView.tableHeaderView = searchController.searchBar

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func myButtonTapped2(sender: UIButton!) {
		print("Custom subview button 2 tapped")
		searchController.searchBar.text = inputTextController.searchTextInput.text

		filterContentForSearchText(searchController.searchBar.text!, scope: "All")

	}

}


// MARK: extentions
extension SearchViewController: UITableViewDataSource {
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if searchController.searchBar.text != "" {
			return filteredBlogs.count
		}
		return swiftBlogs.count

	}

	// swiftlint:disable line_length
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		// swiftlint:enable line_length

		let cell = tableView.dequeueReusableCellWithIdentifier("TextCell", forIndexPath: indexPath)
		let blog: Blog
		if searchController.searchBar.text != "" {
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
		filteredBlogs = swiftBlogs.filter({( blog: Blog) -> Bool in
			let categoryMatch = (scope == "All") || (blog.category == scope)
			return categoryMatch && blog.name.lowercaseString.containsString(searchText.lowercaseString)
		})
		myTableView.reloadData()
	}

}

extension SearchViewController: UITableViewDelegate {
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)

		let row = indexPath.row
		print(swiftBlogs[row])
	}
}

extension SearchViewController: UISearchBarDelegate {
	// MARK: - UISearchBar Delegate
	func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
		filterContentForSearchText(searchBar.text!)
	}
}

extension SearchViewController: UISearchResultsUpdating {
	// MARK: - UISearchResultsUpdating Delegate
	func updateSearchResultsForSearchController(searchController: UISearchController) {
		//    let searchBar = searchController.searchBar

		filterContentForSearchText(searchController.searchBar.text!, scope: "All")
	}
}
