//
//  DetailViewController.swift
//  HorizontalCollectionViews2
//
//  Created by Jim Clark on 5/22/18.
//  Copyright © 2018 Campuslabs. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var detailDescriptionLabel: UILabel!


  func configureView() {
    // Update the user interface for the detail item.
    if let movie = detailItem {
        if let label = detailDescriptionLabel {
            label.text = movie.title
        }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    configureView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  var detailItem: Movie? {
    didSet {
        // Update the view.
        configureView()
    }
  }


}

