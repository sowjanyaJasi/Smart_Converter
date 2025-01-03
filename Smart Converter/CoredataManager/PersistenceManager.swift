//
//  PersistenceManager.swift
//  Smart Converter
//
//  Created by Sowjanya on 28/12/24.
//

import Foundation
import CoreData

final class PersistenceManager{
    private init() {
        
    }
    
    static let shared = PersistenceManager()
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Smart_Converter")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Core Data Saving support
    
    func savePesistenceContext() {
        
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("saved Successfully")
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchData<T: NSManagedObject>(_ objectType: T.Type,_ search: NSPredicate? = nil,_ sort: NSSortDescriptor? = nil,_ multiSort: [NSSortDescriptor]? = nil) -> [T]  {
        let entityName = String(describing: objectType)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        if let predicate = search
        {
            fetchRequest.predicate = predicate
        }
        if let sortDescriptors = multiSort
        {
            fetchRequest.sortDescriptors = sortDescriptors
        }
        else if let sortDescriptor = sort
        {
            fetchRequest.sortDescriptors = [sortDescriptor]
        }
        do {
            let fetchObjects = try context.fetch(fetchRequest) as? [T]
            return fetchObjects ?? [T]() // return results as! [T]
        } catch {
            print(error)
            return [T]() //return []
        }
    }
    
    func deleteRecord(_ object: NSManagedObject)
    {
        context.delete(object)
        savePesistenceContext()
    }
    
    func deleteRecords<T: NSManagedObject>(_ type : T.Type, search: NSPredicate? = nil)
    {
        let results = fetchData(T.self, search)
        for record in results
        {
            context.delete(record)
        }
        savePesistenceContext()
    }
    
}


