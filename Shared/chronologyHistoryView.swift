//
//  chronologyHistoryView.swift
//  chronology
//
//  Created by Halcyone Rapp on 1/22/22.
//

import CoreData
import SwiftUI

struct chronologyHistoryView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var days: FetchedResults<ChronologyDay>

    var body: some View {
        List {
            ForEach(days, id: \.self) { day in
                Text(day.wrapdDayString)
                Section(day.wrapdDayString) {
                    ForEach(day.timeblockArray, id: \.self) { tb in
                        Text(tb.prettyString)
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
           // delete it from the context
            moc.delete(day)
        }
        // save the context
        try? moc.save()
    }
}

struct chronologyHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        chronologyHistoryView()
    }
}
