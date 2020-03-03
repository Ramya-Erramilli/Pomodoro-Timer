//
//  Stopwatch.swift
//  PomodoroTimer
//
//  Created by Ramya Seshagiri on 20/02/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import Foundation

class Stopwatch{
    
    private var startTime : NSDate?
    
    var elapsedTime: TimeInterval{
        if let startTime = self.startTime{
            return -startTime.timeIntervalSinceNow
        }else{
            return 0
        }
    }
    
    var isRunning:Bool{
        return startTime != nil
    }
    
    func start(){
        startTime = NSDate()
    }
    func stop() {
        startTime = nil
    }
    
    
}
