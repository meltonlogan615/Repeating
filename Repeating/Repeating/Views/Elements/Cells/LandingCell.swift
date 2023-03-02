//
//  LandingCell.swift
//  Repeating
//
//  Created by Logan Melton on 3/2/23.
//

import UIKit

class LandingCell: UICollectionViewCell {
  var storeView: UIView!
  var initialLabel: UILabel!
  var titleLabel: UILabel!
  var storeLabel: UILabel!
  var itemCountLabel: UILabel!
  var valueView: UIView!
  var valueLabel: UILabel!

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    layout()
    print(contentView.frame.height)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension LandingCell {
  private func setup() {
    storeView = UIView()
    storeView.translatesAutoresizingMaskIntoConstraints = false
    storeView.backgroundColor = .secondarySystemBackground
    storeView.layer.cornerRadius = 8
    storeView.clipsToBounds = true

    initialLabel = UILabel()
    initialLabel.translatesAutoresizingMaskIntoConstraints = false
    initialLabel.font = .preferredFont(forTextStyle: .largeTitle)
    initialLabel.textAlignment = .center

    titleLabel = UILabel()
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = .preferredFont(forTextStyle: .title1)
    titleLabel.backgroundColor = .yellow

    storeLabel = UILabel()
    storeLabel.translatesAutoresizingMaskIntoConstraints = false
    storeLabel.font = .preferredFont(forTextStyle: .body)

    itemCountLabel = UILabel()
    itemCountLabel.translatesAutoresizingMaskIntoConstraints = false
    itemCountLabel.font = .preferredFont(forTextStyle: .body)
    itemCountLabel.backgroundColor = .green

    valueView = UIView()
    valueView.translatesAutoresizingMaskIntoConstraints = false
    valueView.backgroundColor = .orange
    valueView.widthAnchor.constraint(equalTo: valueView.heightAnchor).isActive = true

    valueLabel = UILabel()
    valueLabel.translatesAutoresizingMaskIntoConstraints = false
    valueLabel.font = .preferredFont(forTextStyle: .title3)
    valueLabel.textAlignment = .center
    valueLabel.backgroundColor = .red
    valueLabel.layer.cornerRadius = 8
    valueLabel.clipsToBounds = true
    valueLabel.adjustsFontSizeToFitWidth = true
  }

  private func layout() {
    contentView.addSubview(storeView)
    let storeViewHeight = contentView.frame.height * 0.6
    NSLayoutConstraint.activate([
      storeView.heightAnchor.constraint(equalToConstant: storeViewHeight),
      storeView.widthAnchor.constraint(equalTo: storeView.heightAnchor),
      storeView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      storeView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2)
    ])

    storeView.addSubview(initialLabel)
    NSLayoutConstraint.activate([
      initialLabel.heightAnchor.constraint(equalTo: storeView.heightAnchor),
      initialLabel.widthAnchor.constraint(equalTo: storeView.widthAnchor),
      initialLabel.centerXAnchor.constraint(equalTo: storeView.centerXAnchor),
      initialLabel.centerYAnchor.constraint(equalTo: storeView.centerYAnchor)
    ])

    let labelStack = UIStackView(arrangedSubviews: [titleLabel, storeLabel, itemCountLabel])
    labelStack.translatesAutoresizingMaskIntoConstraints = false
    labelStack.axis = .vertical
    labelStack.distribution = .fillEqually

    contentView.addSubview(labelStack)
    NSLayoutConstraint.activate([
      labelStack.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2),
      labelStack.leadingAnchor.constraint(equalToSystemSpacingAfter: storeView.trailingAnchor, multiplier: 1),
      contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: labelStack.bottomAnchor, multiplier: 2)
    ])

    let valueWidth = contentView.frame.height * 0.6
    let valueHeight = contentView.frame.height * 0.5
    contentView.addSubview(valueLabel)
    NSLayoutConstraint.activate([
      valueLabel.widthAnchor.constraint(equalToConstant: valueWidth),
      valueLabel.heightAnchor.constraint(equalToConstant: valueHeight),
      valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: valueLabel.trailingAnchor, multiplier: 2)
    ])
  }
}
