//
//  ctbView.swift
//  chronology
//
//  Created by Halcyone Rapp on 1/23/22.
//

import CoreData
import SwiftUI

/// this view is all about giving me access to mistakes so i can delete them!

struct ctbView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var ctbs: FetchedResults<ChronologyTB>

    var body: some View {
        List {
            ForEach(ctbs.sorted(by: >), id: \.self) { ctb in
                Text(ctb.prettyString)
            }
            //.onDelete(perform: deleteCtb)
        }
    }

    func deleteCtb(at offsets: IndexSet) {
        for offset in offsets {
            // find this day in our fetch request
            /// currently this deletes the wrong item due to the order reveral above
            /// but you can delete elsewhere
            let ctb = ctbs[offset]
           // delete it from the context
            moc.delete(ctb)
        }
        // save the context (uncomment for release)
        try? moc.save()
    }
}
