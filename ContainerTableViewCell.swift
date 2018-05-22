//
//  ContainerTableViewCell.swift
//  HorizontalCollectionViews2
//
//  Created by Jim Clark on 5/22/18.
//  Copyright © 2018 Campuslabs. All rights reserved.
//

import UIKit

class ContainerTableViewCell: UITableViewCell {

  @IBOutlet weak var collectionView: CellCollectionView!

  var rowIndex: Int?

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code

    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal
    flowLayout.itemSize = CGSize(width: 120, height: 150)
    collectionView.setCollectionViewLayout(flowLayout, animated: false)
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

}
