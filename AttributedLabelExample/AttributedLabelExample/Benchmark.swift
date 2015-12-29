//
//  Benchmark.swift
//  AttributedLabelExample
//
//  Created by Kyohei Ito on 2015/07/20.
//  Copyright © 2015年 Kyohei Ito. All rights reserved.
//

import UIKit

class Benchmark {
    var startTime: NSDate!
    
    func start() {
        print("start")
        startTime = NSDate()
    }
    
    func finish() {
        let elapsed = NSDate().timeIntervalSinceDate(startTime) as Double
        let string = String(format: "%.8f", elapsed)
        print(string)
    }
}
