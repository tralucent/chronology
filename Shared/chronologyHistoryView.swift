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
                Section(day.wrapdDayString) {
                    ForEach(day.timeblockArray, id: \.self) { tb in
                        Text(tb.prettyString)
                    }
                }
            }
        }
    }
}

struct chronologyHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        chronologyHistoryView()
    }
}
