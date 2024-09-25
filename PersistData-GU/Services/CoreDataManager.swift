//
//  CoreDataManager.swift
//  PersistData-GU
//
//  Created by Jaimin Raval on 23/09/24.
//

import UIKit
import CoreData

final class CoreDataManager {
    
    
    //  Write func for CD
    static func addToCoreData(jokeObject: JokeModel) {
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = delegate.persistentContainer.viewContext
        
        guard let jokeEntity = NSEntityDescription.entity(forEntityName: "Jokes", in: managedContext) else { return }
        
        let joke = NSManagedObject(entity: jokeEntity, insertInto: managedContext)
        
        joke.setValue(jokeObject.id, forKey: "id")
        joke.setValue(jokeObject.type, forKey: "type")
        joke.setValue(jokeObject.setup, forKey: "setup")
        joke.setValue(jokeObject.punchline, forKey: "punchline")
        
        do {
            try managedContext.save()
            debugPrint("Saved to CD Successfully")
            
        } catch let err as NSError {
            debugPrint("could not save to CoreData. Error: \(err)")
        }
    }
    
    
    //  Read func for CD
    static func readFromCoreData() {
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = delegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Jokes")
        
        do {
            let res = try managedContext.fetch(fetchRequest)
            debugPrint("Fetched from  CD Successfully")

//            for data in res as! [NSManagedObject] {
//                print(data.value(forKey: "setup") as! String)
//                print(data.value(forKey: "punchline") as! String)
//            }
            
            
        } catch let err as NSError {
            debugPrint("can't fetch data from CD, something went wrong: \(NSError.self)")
        }
    }
    
    
    
    
}
