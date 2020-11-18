//
//  PesistentStorage.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/17/20.
//

import CoreData

final class PersistentStorage {
    
    private init(){}
    static let shared = PersistentStorage()
    
    //MARK: - Container Core Data
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "StoryDB")
        container.loadPersistentStores { (description, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    func saveContext() {
        do {
            try context.save()
        } catch let error as NSError{
            fatalError("Could save context \(error) , \(error.userInfo)")
        }
    }
}
