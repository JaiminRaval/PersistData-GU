//
//  CoreDataManager.swift
//  PersistData-GU
//
//  Created by Jaimin Raval on 23/09/24.
//

import UIKit
import CoreData

final class CoreDataManager {
    
    
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
            
        } catch let err as NSError {
            debugPrint("could not save to CoreData. Error: \(err)")
        }
    }
    
    
    
    
}
