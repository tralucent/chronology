//
//  ChronologyTB+CoreDataProperties.swift
//  chronology
//
//  Created by Halcyone Rapp on 1/22/22.
//
//

import Foundation
import CoreData


extension ChronologyTB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ChronologyTB> {
        return NSFetchRequest<ChronologyTB>(entityName: "ChronologyTB")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var timestamp: Date?
    @NSManaged public var category: String?
    @NSManaged public var label: String?
    @NSManaged public var duration: Int16
    @NSManaged public var dayOf: ChronologyDay?
    
    public var wrapdId: UUID {
        id ?? UUID()
    }
    
    public var wrapdTimestamp: Date {
        timestamp ?? Date()
    }
    
    public var wrapdCategory: String {
        category ?? "unknown category"
    }
    
    public var wrapdLabel: String {
        label ?? "unset label"
    }
    
    public var prettyString: String {
        var min = duration/60
        let sec = duration%60
        let hours = min/60
        let fancy: String
        if (hours > 0) {
            min = min%60
            fancy = "\(hours):\(min):\(sec)"
        } else {
            if (min > 0) {
                fancy = "\(min):\(sec)"
            } else {
                fancy = "\(sec) seconds"
            }
        }
        return "\(wrapdCategory) : \(fancy) : \(wrapdLabel)"
    }
    
}

extension ChronologyTB : Identifiable {

}

extension ChronologyTB : Comparable {
    public static func < (lhs: ChronologyTB, rhs: ChronologyTB) -> Bool {
        return lhs.wrapdTimestamp < rhs.wrapdTimestamp
    }
    
    
}
