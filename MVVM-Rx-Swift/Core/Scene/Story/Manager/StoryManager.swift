//
//  StoryManager.swift
//  MVVM-Rx-Swift
//
//  Created by Aldair Raul Cosetito Coral on 11/21/20.
//

import CoreData

struct StoryManager {
    
    let context = PersistentStorage.shared.context
    
    func existEntity(with Id: String, entity: String) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.predicate = NSPredicate(format: "objectId == %@", Id)
        let result = try! context.fetch(fetchRequest)
        return result.count > 0 ? true : false
    }
    
    func save(story: StoryEntity, completion: @escaping(()-> Void)) {
        let entity = NSEntityDescription.entity(forEntityName: "StoryManagedObject",
                                                in: context)!
        let storyMO = NSManagedObject(entity: entity,
                                      insertInto: context)
        storyMO.setValue(story.author, forKey: "author")
        storyMO.setValue(story.objectID, forKey: "objectId")
        storyMO.setValue(story.createdAt, forKey: "createdAt")
        storyMO.setValue(story.storyTitle, forKey: "storyTitle")
        storyMO.setValue(story.storyUrl, forKey: "storyUrl")
        storyMO.setValue(story.title, forKey: "title")
        do {
            try context.save()
        } catch let error as NSError {
            fatalError("Could not save story: \(error.userInfo)")
        }
    }
    
    func getStoryMO(by id: String) -> NSManagedObject? {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "StoryDB")
        fetchRequest.predicate = NSPredicate(format: "objectId", id)
        
        do {
            let result = try context.fetch(fetchRequest).first
            guard result != nil else { return nil }
            return result
        } catch let error as NSError {
            fatalError("Unresolved get story: \(error.userInfo)")
        }
    }
    
    func update(id: String, deleted: Bool) {
        do {
            let result = getStoryMO(by: id)
            guard result != nil else { return }
            result?.setValue(deleted, forKey: "isDeleted")
        } catch let error as NSError {
            fatalError("Could not update story: \(error.userInfo)")
        }
    }
    
    func getStories() -> [StoryEntity] {
        var stories = [StoryEntity]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "StoryManagedObject")
        fetchRequest.predicate = NSPredicate(format: "isDeleted == NO")
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        var storiesMO: [NSManagedObject] = []
        do {

            storiesMO = try context.fetch(fetchRequest)
//            for story in stories {
//                let storyEntity = StoryEntity(story: story)
//            }
            return []
        } catch let error as NSError {
            print(error.userInfo)
        }
        return []
    }
    
//    func convertStoryToStoryEntity(entity: NSManagedObject) -> Story {
//        
//        return Story(
//    }
    
}
