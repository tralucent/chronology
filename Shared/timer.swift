//
//  timer.swift
//  chronology
//
//  Created by Halcyone Rapp on 1/22/22.
//

import CoreData
import Foundation
import SwiftUI

class Timer: ObservableObject {
    
    @Environment(\.managedObjectContext) var moc
    
    private var sourceTimer: DispatchSourceTimer?
    private let queue = DispatchQueue(label: "tracker.timer")
    private var counter: Int16 = 0
    private var currentTB = ChronologyTB()
    
    @Published var category = "category" {
        didSet {
            self.currentTB.category = category
        }
    }

    var timerString = "00:00:00" {
        didSet {
            self.update()
        }
    }
    
    var paused = true {
        didSet {
            self.update()
        }
    }
    
    func start() {
        if self.paused {self.paused = !self.paused}
        guard let _ = self.sourceTimer else {
            self.startTimer()
            return
        }
        self.resumeTimer()
    }

    func stop() {
        if (!self.paused) {self.paused = !self.paused}
        self.sourceTimer?.suspend()
        self.reset()
    }

    func pause() {
        self.paused = !self.paused
        self.sourceTimer?.suspend()
    }
    
    func update() {
        objectWillChange.send()
    }
    
    func reset() {
        if ((self.counter) != 0) {
            self.counter = 0
        }
        self.timerString = "00:00:00"
        try? moc.save()
        currentTB = ChronologyTB(context: moc)
    }
    
    func isPaused() -> Bool {
        return self.paused
    }

    private func startTimer() {
        self.sourceTimer = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags.strict, queue: self.queue)
        self.currentTB = ChronologyTB(context: moc)
        self.resumeTimer()
    }
    
    private func resumeTimer() {
        self.sourceTimer?.setEventHandler { self.updateTimer() }
        self.sourceTimer?.schedule(deadline: .now(), repeating: 1)
        self.sourceTimer?.resume()
    }
    
    private func stopTimer() {
        self.sourceTimer?.suspend()
        self.reset()
    }

    private func updateTimer() {
        self.counter += 1
        DispatchQueue.main.async {
            self.timerString = Timer.convertCountToTime(counter: Int(self.counter))
        }
    }
}

extension Timer {
    static func convertCountToTime(counter: Int) -> String {
        let seconds = counter % 60
        let minutes = (counter / 60) % 60
        let hours = (counter / 60) / 60
        
        var secondsString = "\(seconds)"
        var minutesString = "\(minutes)"
        var hoursString = "\(hours)"
        
        if seconds < 10 {
            secondsString = "0" + secondsString
        }
        
        if minutes < 10 {
            minutesString = "0" + minutesString
        }
        
        if hours < 10 {
            hoursString = "0" + hoursString
        }
        
        return "\(hoursString):\(minutesString):\(secondsString)"
    }
}
