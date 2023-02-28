//
//  StorageProvider.swift
//  Repeating
//
//  Created by Logan Melton on 2/27/23.
//

import CoreData
import Foundation

class StorageProvider {
  let persistentContainer: NSPersistentContainer
  
  init(persistentContainer: NSPersistentContainer) {
    self.persistentContainer = NSPersistentContainer(name: "AllItems")
    persistentContainer.loadPersistentStores { description, error in
      if let error = error {
        fatalError("Yer container is janked, \(error)")
      }
    }
  }
}

// MARK: - Save Lists
// MARK: - Edit Lists
// MARK: - Delete Lists
