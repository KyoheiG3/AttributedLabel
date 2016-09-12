//
//  Benchmark.swift
//  AttributedLabelExample
//
//  Created by Kyohei Ito on 2015/07/20.
//  Copyright © 2015年 Kyohei Ito. All rights reserved.
//

import UIKit

class Benchmark {
    var startTime: Date!
    
    func start() {
        print("start")
        startTime = Date()
    }
    
    func finish() {
        let elapsed = Date().timeIntervalSince(startTime) as Double
        let string = String(format: "%.8f", elapsed)
        print(string)
    }
}
