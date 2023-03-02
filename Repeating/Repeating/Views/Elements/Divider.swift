//
//  Divider.swift
//  Repeating
//
//  Created by Logan Melton on 3/2/23.
//

import UIKit

class Divider: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .systemFill
    layer.cornerRadius = 8
    layer.borderColor = UIColor.secondarySystemFill.cgColor
    layer.borderWidth = 0.5
    clipsToBounds = true
    heightAnchor.constraint(equalToConstant: 1).isActive = true
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
