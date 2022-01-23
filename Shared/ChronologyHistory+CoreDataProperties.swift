//
//  ChronologyHistory+CoreDataProperties.swift
//  chronology
//
//  Created by Halcyone Rapp on 1/22/22.
//
//

import Foundation
import CoreData


extension ChronologyHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ChronologyHistory> {
        return NSFetchRequest<ChronologyHistory>(entityName: "ChronologyHistory")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var history: NSSet?
    
    public var wrapdId = {
        id ?? UUID()
    }
    
    public var historyArray: [ChronologyDay] {
        let set = history as? Set<ChronologyDay> ?? []
        return set.sorted {
            $0.wrapdDayString < $1.wrapdDayString
        }
    }

}

// MARK: Generated accessors for history
extension ChronologyHistory {

    @objc(addHistoryObject:)
    @NSManaged public func addToHistory(_ value: ChronologyDay)

    @objc(removeHistoryObject:)
    @NSManaged public func removeFromHistory(_ value: ChronologyDay)

    @objc(addHistory:)
    @NSManaged public func addToHistory(_ values: NSSet)

    @objc(removeHistory:)
    @NSManaged public func removeFromHistory(_ values: NSSet)

}

extension ChronologyHistory : Identifiable {

}
