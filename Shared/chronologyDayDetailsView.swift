//
//  chronologyDayDetailsView.swift
//  chronology
//
//  Created by Halcyone Rapp on 1/24/22.
//

import CoreData
import SwiftUI

struct chronologyDayDetailsView: View {
    @Environment(\.managedObjectContext) var moc
    @StateObject var day: ChronologyDay

    var body: some View {
            List {
                ForEach(day.timeblockArray.sorted(), id: \.self) { tb in
                    Text(tb.prettyString)
                }
                .onDelete(perform: deleteCtb)
            }
        .navigationTitle(day.wrapdDayString)
    }
    
    //*
    /// currently this deletes, but the view restores the list item, even though the underlying
    /// value is gone (phantom delete that is real - can crash program)
    func deleteCtb(at offsets: IndexSet) {
        for offset in offsets {
            // find this day in our fetch request
            let tb = day.timeblockArray[offset]
           // delete it from the context
            moc.delete(tb)
        }
        // save the context
        try? moc.save()
    }
    // */
}
