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
        "\(wrapdCategory) : \(duration) : \(wrapdLabel)"
    }
    
}

extension ChronologyTB : Identifiable {

}
