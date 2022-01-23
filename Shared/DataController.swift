//
//  DataController.swift
//  chronology
//
//  Created by Halcyone Rapp on 1/22/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ChronologyModel")
    
    init() {
        container.loadPersistentStores { descrition, error in
            if let error = error {
                print("CoreDate failed to load: \(error.localizedDescription)")
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
