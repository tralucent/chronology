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
            ForEach(ctbs, id: \.self) { ctb in
                        Text(ctb.prettyString)
            }
            .onDelete(perform: deleteCtb)
        }
    }

    func deleteCtb(at offsets: IndexSet) {
        for offset in offsets {
            // find this day in our fetch request
            let ctb = ctbs[offset]
           // delete it from the context
            moc.delete(ctb)
        }
        // save the context
        try? moc.save()
    }
}

struct ctbView_Previews: PreviewProvider {
    static var previews: some View {
        ctbView()
    }
}
