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
        NavigationView
        {
            VStack {
                timerView()
                //chronologyDaysView()
                ctbView()
            
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
