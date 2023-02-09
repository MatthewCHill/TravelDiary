//
//  EntryController.swift
//  TravelDiary
//
//  Created by Matthew Hill on 2/9/23.
//

import Foundation

class EntryController {
    
    // MARK: - Singleton
    static let sharedInstance = EntryController()
    // MARK: - Source Of Truth
    var entries: [Entry] = []
    // MARK: - CRUD FUNCTIONS
    func createEntry(entry: String, address: String, entryDate: Date, body: String ) {
        let newEntry = Entry(title: entry, address: address, body: body)
        entries.append(newEntry)
        save()
    }
    
    func update() {
        save()
    }
    
    func delete() {
        save()
    }
    
    // MARK: - Persistence
    
    func save() {
        
    }
    func load() {
        
    }
    
    
} //End of class
