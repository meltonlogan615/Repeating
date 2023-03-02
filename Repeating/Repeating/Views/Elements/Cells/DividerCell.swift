//
//  DividerCell.swift
//  Repeating
//
//  Created by Logan Melton on 3/2/23.
//

import UIKit

class DividerCell: UICollectionViewCell {
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.backgroundColor = .systemFill
    contentView.layer.borderColor = UIColor.secondarySystemFill.cgColor
    contentView.layer.borderWidth = 0.5
    contentView.layer.cornerRadius = 8
    contentView.clipsToBounds = true
    contentView.heightAnchor.constraint(equalToConstant: 1).isActive = true
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
