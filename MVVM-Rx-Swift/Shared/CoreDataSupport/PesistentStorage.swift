//
//  PesistentStorage.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/17/20.
//

import CoreData

final class PersistentStorage {
    
    private init() {}
    static let shared = PersistentStorage()
    
    //MARK: - Container Core data
    lazy var container: NSPersistentContainer = {
       let container = NSPersistentContainer()
        container.loadPersistentStores { (descriptor, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error : \(error.userInfo)")
            }
        }
        return container
    }()
    
    lazy var context = PersistentStorage.shared.container.viewContext
    
    //MARK: - Save Context
    func saveContext() {
        do {
            try context.save()
        } catch let error as NSError {
            fatalError("Could not resolved: \(error.userInfo)")
        }
    }
    
    //MARK: - Fetch
    func fetRequest<T: NSManagedObject>(managedObject: T.Type) -> [T]? {
        do {
            guard let result = try PersistentStorage.shared.context.fetch(managedObject.fetchRequest()) as? [T] else { return nil }
            return result
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
}
