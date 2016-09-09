//
//  CustomizeViewController.swift
//  AttributedLabelExample
//
//  Created by Kyohei Ito on 2015/07/17.
//  Copyright © 2015年 Kyohei Ito. All rights reserved.
//

import UIKit
import AttributedLabel

class CustomizeViewController: UIViewController {
    @IBOutlet weak var attributedLabel: AttributedLabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        attributedLabel.text = "AttributedLabel"
    }
    
    private func rand(_ random: UInt32) -> CGFloat {
        return CGFloat(arc4random_uniform(random))
    }
    
    private func randColor(_ random: UInt32) -> UIColor {
        return UIColor(hue: rand(random) / 10, saturation: 0.8, brightness: 0.8, alpha: 1)
    }
    
    @IBAction func buttonTapped(_ sender: AnyObject) {
        if let button = sender as? UIButton, let alignment = AttributedLabel.ContentAlignment(rawValue: button.tag) {
            attributedLabel.contentAlignment = alignment
        }
    }
    
    @IBAction func changeTextColor() {
        attributedLabel.textColor = randColor(10)
    }
    
    @IBAction func changeFontSize() {
        attributedLabel.font = UIFont.systemFont(ofSize: rand(20) + 12)
    }
    
    @IBAction func changeShadow() {
        let shadow = NSShadow()
        shadow.shadowBlurRadius = rand(5)
        shadow.shadowOffset = CGSize(width: rand(5), height: rand(5))
        shadow.shadowColor = randColor(10)
        attributedLabel.shadow = shadow
    }
}

