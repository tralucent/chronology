//
//  ContentView.swift
//  Shared
//
//  Created by Halcyone Rapp on 1/22/22.
//

//import CoreData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var timer = Timer()

    //@FetchRequest(sortDescriptors: []) var days: FetchedResults<ChronologyDay>
    
    var body: some View {
        VStack {
            timerView()
            chronologyHistoryView()
            Button("Add a little time") {
                let tb1 = ChronologyTB(context: moc)
                tb1.duration = 13
                tb1.dayOf = ChronologyDay(context: moc)
                tb1.dayOf?.dayString = "2022.01.21"
                let tb2 = ChronologyTB(context: moc)
                tb2.duration = 26
                tb2.dayOf = ChronologyDay(context: moc)
                tb2.dayOf?.dayString = "2022.01.21"
                let tb3 = ChronologyTB(context: moc)
                tb3.duration = 13
                tb3.dayOf = ChronologyDay(context: moc)
                tb3.dayOf?.dayString = "2022.01.22"
                
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
