//
//  JokeModel.swift
//  PersistData-GU
//
//  Created by Jaimin Raval on 23/09/24.
//

import Foundation


struct JokeModel: Codable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
    
}
