//
//  ContentView.swift
//  Shared
//
//  Created by Halcyone Rapp on 1/22/22.
//
import CoreData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var timer = Timer()

    //@FetchRequest(sortDescriptors: []) var days: FetchedResults<ChronologyDay>
    
    var body: some View {
        VStack {
            timerView()
            chronologyHistoryView()
            ctbView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
