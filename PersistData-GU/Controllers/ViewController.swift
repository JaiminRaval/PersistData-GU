//
//  ViewController.swift
//  PersistData-GU
//
//  Created by Jaimin Raval on 23/09/24.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUsrDefaults()
        
        writeToCD()
    }
    
    
    func setUsrDefaults() {
        savetoUsrDefault(key: "User", value: "John Appleseed")
        let str = readFromUsrDefault(key: "User")
        print(str)
        navigationItem.title = "Hello \(str)"
    }

    
    //  persist data using UserDefaults:
    func savetoUsrDefault(key: String, value: Any) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        
    }
    
    
    //  retrive persist data using UserDefaults:
    func readFromUsrDefault(key: String) -> String {
        
        let defaults = UserDefaults.standard
        guard let retrivedData = defaults.string(forKey: key) else { return "" }
        return retrivedData
        
    }
    
    
    func writeToCD() {
        let joke = JokeModel(id: 1, type: "General", setup: "", punchline: "")
        CoreDataManager.addToCoreData(jokeObject: joke)
    }
    
    

}

