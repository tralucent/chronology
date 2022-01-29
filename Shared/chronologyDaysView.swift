//
//  chronologyDaysView.swift
//  chronology
//
//  Created by Halcyone Rapp on 1/24/22.
//

import SwiftUI

struct chronologyDaysView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var days: FetchedResults<ChronologyDay>

    var body: some View {
        List {
            ForEach(days, id: \.self) { day in
                NavigationLink() {
                    chronologyDayDetailsView(day: day)
                } label: {
                    VStack (alignment: .leading) {
                        Text(day.wrapdDayString)
                    }
                }
            }
            .onDelete(perform: deleteDay)
        }
    }

    func deleteDay(at offsets: IndexSet) {
        for offset in offsets {
            // find this day in our fetch request
            let day = days[offset]
            // loop through the timeblocks for this day
            for ctb in day.timeblockArray {
                // and delete them
                moc.delete(ctb);
            }
           // delete the day itself from the context
            moc.delete(day)
        }
        // save the context (uncomment for release)
        try? moc.save()
        
    }
}
