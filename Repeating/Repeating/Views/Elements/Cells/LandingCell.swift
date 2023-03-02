//
//  LandingCell.swift
//  Repeating
//
//  Created by Logan Melton on 3/2/23.
//

import UIKit

class LandingCell: UICollectionViewCell {
  var cellImage: UIImageView!
  var titleLabel: UILabel!
  var itemCountLabel: UILabel!
  var valueLabel: UILabel!

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    layout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension LandingCell {
  private func setup() {
    cellImage = UIImageView()
    cellImage.frame.size = CGSize(width: 100, height: 100)
    cellImage.translatesAutoresizingMaskIntoConstraints = false
    cellImage.tintColor = .label
    cellImage.backgroundColor = .orange

    titleLabel = UILabel()
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = .preferredFont(forTextStyle: .title1)
    titleLabel.backgroundColor = .yellow

    itemCountLabel = UILabel()
    itemCountLabel.translatesAutoresizingMaskIntoConstraints = false
    itemCountLabel.font = .preferredFont(forTextStyle: .title2)
    itemCountLabel.backgroundColor = .green

    valueLabel = UILabel()
    valueLabel.translatesAutoresizingMaskIntoConstraints = false
    valueLabel.font = .preferredFont(forTextStyle: .title1)
    valueLabel.backgroundColor = .blue
    valueLabel.text = "$5.99"
    valueLabel.textAlignment = .center
  }

  private func layout() {
    let labelStack = UIStackView(arrangedSubviews: [titleLabel, itemCountLabel])
    labelStack.translatesAutoresizingMaskIntoConstraints = false
    labelStack.axis = .vertical
    labelStack.distribution = .fillEqually

    let cellStack = UIStackView(arrangedSubviews: [cellImage, labelStack, valueLabel])
    cellStack.translatesAutoresizingMaskIntoConstraints = false
    cellStack.axis = .horizontal
    cellStack.distribution = .fillProportionally

    contentView.addSubview(cellStack)
    NSLayoutConstraint.activate([
      cellStack.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2),
      cellStack.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: cellStack.trailingAnchor, multiplier: 2),
      contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: cellStack.bottomAnchor, multiplier: 2)
    ])
  }
}
