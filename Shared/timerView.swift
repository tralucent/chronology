//
//  timerView.swift
//  chronology
//
//  Created by Halcyone Rapp on 1/22/22.
//

import CoreData
import SwiftUI

struct timerView: View {
    
    @Environment(\.managedObjectContext) var moc
    @StateObject var timer = Timer()
    
    let categories = arrayOfCategories()

    var body: some View {
        VStack {
            Picker("Categories", selection: $timer.category) {
                ForEach(categories, id:\.self) { selection in
                    Text(selection.catName).tag(selection.catName)
                }
            }
            .pickerStyle(.menu)
        }
    }
}

struct timerView_Previews: PreviewProvider {
    static var previews: some View {
        timerView()
    }
}


/*
 VStack {
     Picker("Categories", selection: $tracker.current.ctb.category) {
         ForEach(categories, id:\.self) { selection in
             Text(selection.catName).tag(selection.catName)
         }
     }
     .pickerStyle(.menu)
     /*
     .onReceive([self.category].publisher.first()) {
         value in self.category = category
     }
     // */
     //TextField(text.name ?? "No Name", text: Binding(get: {text.name ?? ""}, set: {text.name = $0}))
     TextField("Session label", text: Binding(get: {tracker.current.ctb.label ?? ""}, set: {tracker.current.ctb.label = $0}))
     .frame(width: UIScreen.main.bounds.size.width-26, height: 40, alignment: .center)
     /*
     .onReceive([self.label].publisher.first()) {
         value in self.label = label
     }
     // */
     /*
     .onReceive([self.label].publisher.first()) {
         value in tracker.setLabel(label: self.label)
     }
     // */
     Text("Current Session:")
         .padding()
     Text(convertCountToTime(counter: duration))
         .font(.custom("courier", size: 70))
         .frame(width: UIScreen.main.bounds.size.width, height: 140, alignment: .center)
 }

 */
