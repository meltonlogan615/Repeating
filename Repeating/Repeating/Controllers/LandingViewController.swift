//
//  ViewController.swift
//  Repeating
//
//  Created by Logan Melton on 2/27/23.
//

import UIKit

class LandingViewController: UIViewController {

  var collection: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    style()
    layout()
  }
}

extension LandingViewController {
  private func style() {
    collection = UICollectionView(frame: view.frame, collectionViewLayout: createCompositionalLayout())
    collection.translatesAutoresizingMaskIntoConstraints = false
    collection.isScrollEnabled = false
    collection.register(LandingCell.self, forCellWithReuseIdentifier: "cell")
    collection.dataSource = self
    collection.delegate = self
  }

  private func layout() {
    view.addSubview(collection)
    NSLayoutConstraint.activate([
      collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

extension LandingViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? LandingCell else {
      return collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }
    cell.layer.borderColor = UIColor.black.cgColor
    cell.layer.borderWidth = 2
    cell.cellImage.image = UIImage(systemName: "house")
    cell.titleLabel.text = "Fuckery"
    cell.itemCountLabel.text = "16"
    return cell
  }
}

extension LandingViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print(indexPath.item)
  }
}

extension LandingViewController {
  func createCompositionalLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { _, _ in
      return self.createGroup()
    }
    let config = UICollectionViewCompositionalLayoutConfiguration()
    config.interSectionSpacing = 20
    layout.configuration = config
    return layout
  }

  func createGroup() -> NSCollectionLayoutSection {
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                           heightDimension: .fractionalHeight(1))

    let sectionSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                             heightDimension: .fractionalHeight(1/8))

    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(1))

    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

    let sectionAssembly = NSCollectionLayoutGroup.vertical(layoutSize: sectionSize,
                                                           subitems: [group])

    let section = NSCollectionLayoutSection(group: sectionAssembly)
    return section

  }
}
