//
//  MasterViewController.swift
//  HorizontalCollectionViews2
//
//  Created by Jim Clark on 5/22/18.
//  Copyright © 2018 Campuslabs. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

  var detailViewController: DetailViewController? = nil

  var allCategories: [Category] = [Category]()

  override func viewDidLoad() {
    super.viewDidLoad()

    if let split = splitViewController {
        let controllers = split.viewControllers
        detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
    }

    buildMovieList()
  }

  override func viewWillAppear(_ animated: Bool) {
    clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
    super.viewWillAppear(animated)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Segues

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
      if let movie = sender as? Movie {
        let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
        controller.detailItem = movie
        controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        controller.navigationItem.leftItemsSupplementBackButton = true
      }
    }
  }

  func buildMovieList() {
    let categoryTitles = [ "A", "B", "C", "D", "E"]
    var categories = [Category]()
    for title in categoryTitles {
      var category = Category(title: "Category \(title)")
      for index in 1...5 {
        category.movies.append(Movie(title: "Movie \(title)\(index)"))
      }
      categories.append(category)
    }

    allCategories = categories

  }

  // MARK: - Table View

  override func numberOfSections(in tableView: UITableView) -> Int {
    return allCategories.count
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ContainerTableViewCell
    cell.collectionView.cellRow = indexPath.section
    cell.collectionView.dataSource = self
    cell.collectionView.delegate = self

    return cell
  }

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let sectionCategory = allCategories[section]
    return sectionCategory.title
  }

}

extension MasterViewController: UICollectionViewDataSource {

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView is CellCollectionView {
      let cellCollectionView = collectionView as! CellCollectionView
      let index = cellCollectionView.cellRow ?? 0
      let category = allCategories[index]
      return category.movies.count
    }
    return 0
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: ArticleCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as! ArticleCollectionViewCell
    if collectionView is CellCollectionView {
      let cellCollectionView = collectionView as! CellCollectionView
      let index = cellCollectionView.cellRow ?? 0
      let category = allCategories[index]
      let movie = category.movies[indexPath.row]
      cell.titleLabel.text = movie.title
    }
    return cell
  }
}

extension MasterViewController: UICollectionViewDelegate {

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if collectionView is CellCollectionView {
      let cellCollectionView = collectionView as! CellCollectionView
      let index = cellCollectionView.cellRow ?? 0
      let category = allCategories[index]
      let movie = category.movies[indexPath.row]
      performSegue(withIdentifier: "showDetail", sender: movie)
    }
  }
}

