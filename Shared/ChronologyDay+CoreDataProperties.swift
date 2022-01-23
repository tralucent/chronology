//
//  ChronologyDay+CoreDataProperties.swift
//  chronology
//
//  Created by Halcyone Rapp on 1/22/22.
//
//

import Foundation
import CoreData


extension ChronologyDay {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ChronologyDay> {
        return NSFetchRequest<ChronologyDay>(entityName: "ChronologyDay")
    }

    @NSManaged public var day: Date?
    @NSManaged public var dayString: String?
    @NSManaged public var label: String?
    @NSManaged public var id: UUID?
    @NSManaged public var timeblocks: NSSet?
    //@NSManaged public var history: ChronologyHistory?
    
    public var wrapdDay: Date {
        day ?? Date()
    }
    
    public var wrapdDayString: String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy.mm.dd"
        let now = dateFormater.string(from: day ?? Date())
        return dayString ?? now
    }
    
    public var wrapdLabel: String {
        label ?? "unlabeled"
    }
    
    public var wrapdId: UUID {
        id ?? UUID()
    }
    
    public var timeblockArray: [ChronologyTB] {
        let set = timeblocks as? Set<ChronologyTB> ?? []
        return set.sorted {
            $0.wrapdTimestamp < $1.wrapdTimestamp
        }
    }

}

// MARK: Generated accessors for timeblocks
extension ChronologyDay {

    @objc(addTimeblocksObject:)
    @NSManaged public func addToTimeblocks(_ value: ChronologyTB)

    @objc(removeTimeblocksObject:)
    @NSManaged public func removeFromTimeblocks(_ value: ChronologyTB)

    @objc(addTimeblocks:)
    @NSManaged public func addToTimeblocks(_ values: NSSet)

    @objc(removeTimeblocks:)
    @NSManaged public func removeFromTimeblocks(_ values: NSSet)

}

extension ChronologyDay : Identifiable {

}
