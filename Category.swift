//
//  Category.swift
//  HorizontalCollectionViews2
//
//  Created by Jim Clark on 5/22/18.
//  Copyright © 2018 Campuslabs. All rights reserved.
//

import Foundation

struct Category {
  var title: String
  var movies: [Movie]

  init(title: String) {
    self.title = title
    self.movies = [Movie]()
  }
}
