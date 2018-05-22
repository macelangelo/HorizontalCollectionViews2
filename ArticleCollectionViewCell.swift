//
//  ArticleCollectionViewCell.swift
//  HorizontalCollectionViews2
//
//  Created by Jim Clark on 5/22/18.
//  Copyright © 2018 Campuslabs. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var titleLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()

    self.backgroundView = UIView(frame: self.bounds)
    self.backgroundColor = UIColor.white
  }
  
}
