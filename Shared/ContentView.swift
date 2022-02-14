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
    
    var body: some View {
        /// NavigationView gives us the ability to drill down into more detailed Views and back out of them
        NavigationView
        {
            VStack {
                /// timerView does the heavy lifting of our app
                timerView()
                //chronologyDaysView()
                ctbView()
                /// NavigationLink to take us to the history of days
                NavigationLink() {
                    chronologyDaysView()
                } label: {
                    VStack (alignment: .leading) {
                        Text("history")
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

/// coredata fucks with preview functionality
/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 */
