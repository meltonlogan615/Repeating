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
    self.persistentContainer = NSPersistentContainer(name: "Repeating")
    persistentContainer.loadPersistentStores { description, error in
      if let error = error {
        fatalError("Yer container is janked, \(error)")
      }
    }
  }
}

// MARK: - Save Lists
extension StorageProvider {
  func saveItem(name: String, quantity: Int64, unitType: String, costEach: Float) {
    let item = Item(context: persistentContainer.viewContext)
    item.name = name
    item.quantity = quantity
    item.unitType = unitType
    item.costEach = costEach
    do {
      try persistentContainer.viewContext.save()
    } catch {
      persistentContainer.viewContext.rollback()
    }
  }
}

// MARK: - Retrieving Items
extension StorageProvider {
  func getAllItems() -> [Item] {
    let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
    fetchRequest.returnsObjectsAsFaults = false
    do {
      return try persistentContainer.viewContext.fetch(fetchRequest)
    } catch {
      print("\(error)")
      return []
    }
  }
}

// MARK: - Delete Items
extension StorageProvider {
  func deleteItem(_ item: Item) {
    persistentContainer.viewContext.delete(item)
    
    do {
      try persistentContainer.viewContext.save()
    } catch {
      persistentContainer.viewContext.rollback()
    }
  }
}

// MARK: - Edit Items
extension StorageProvider {
  func updateItem() {
    do {
      try persistentContainer.viewContext.save()
    } catch {
      persistentContainer.viewContext.rollback()
    }
  }
}
