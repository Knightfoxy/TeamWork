//
//  PersistentManager.swift
//  CoreDataRelationDeletionApp
//
//  Created by Ayush Mishra on 20/07/22.
//

import Foundation
import CoreData

class PersistentStorage {
    static let shared = PersistentStorage()
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataRelationDeletionApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext

    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func fetchManagedObject<T : NSManagedObject>(managedObject : T.Type)-> [T]? {
        do {
            guard let result = try PersistentStorage.shared.context.fetch(managedObject.fetchRequest())as? [T] else {return nil}
            return result
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
    // MARK: - Remove Managed Object from core data
    func removeMangedObject<T : NSManagedObject>(data: T) {
        viewContext.delete(data)
        saveContext()
    }

}
