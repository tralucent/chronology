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

    @State private var category = ""
    @State private var label = ""
    
    private var categories = arrayOfCategories()
    private var buttonColors = [Color.purple, Color.indigo, Color.cyan, Color.indigo, Color.purple]
    @State private var counter = 0

    var body: some View {
        VStack {
            Picker("Categories", selection: $category) {
                ForEach(categories, id:\.self) { selection in
                    Text(selection.catName).tag(selection.catName)
                }
            }
            .onAppear( perform: {category = categories[0].catName} )
            .pickerStyle(.menu)
            TextField("Session label", text: $label)
            .frame(width: UIScreen.main.bounds.size.width-26, height: 40, alignment: .center)
            Text("Current Session:")
                .padding()
            Text(Timer.convertCountToTime(counter: Int(timer.counter)))
                .font(.custom("courier", size: 70))
                .frame(width: UIScreen.main.bounds.size.width, height: 140, alignment: .center)
            HStack {
                TimerButton(actions: [self.timer.start, self.timer.pause], labels: ["Start", "Pause"], color: buttonColors, isPaused: self.timer.isPaused(), duration: 0, data: [])
                TimerButton(actions: [self.timer.reset, self.timer.stop], labels: ["Reset", "Stop"], color: buttonColors, isPaused: self.timer.isPaused(), duration: timer.counter, data: [self.category, self.label])
            }
        }
    }
}


struct TimerButton: View {
    @Environment(\.managedObjectContext) var moc
    
    var actions: [() -> Void]
    var labels: [String]
    var color: [Color]
    var isPaused: Bool
    var duration: Int16
    var data: [String]
    
    var body: some View {
        let buttonWidth = (UIScreen.main.bounds.size.width / 2) - 12
        
        return Button(action: {
            if self.isPaused {
                self.actions[0]()
            } else {
                self.actions[1]()
            }
            if self.duration > 0 {
                let ctb = ChronologyTB(context: moc)
                ctb.category = data[0]
                ctb.label = data[1]
                ctb.duration = duration
                ctb.timestamp = Date()
                ctb.dayOf = ChronologyDay(context: moc)
                let fancyday = DateFormatter()
                fancyday.dateFormat = "yyyy.MM.dd"
                ctb.dayOf?.dayString = fancyday.string(from: Date())
                try? moc.save()
            }
        }) {
            if isPaused {
                Text(self.labels[0])
                    .foregroundColor(Color.white)
                    .frame(width: buttonWidth, height: 50, alignment: .center)
            } else {
                Text(self.labels[1])
                    .foregroundColor(Color.white)
                    .frame(width: buttonWidth, height: 50, alignment: .center)
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: self.color), startPoint: .topLeading, endPoint: .bottom))
    }
}

