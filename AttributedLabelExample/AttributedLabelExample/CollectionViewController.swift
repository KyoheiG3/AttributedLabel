//
//  CollectionViewController.swift
//  AttributedLabelExample
//
//  Created by Kyohei Ito on 2015/07/20.
//  Copyright © 2015年 Kyohei Ito. All rights reserved.
//

import UIKit
import AttributedLabel

protocol Configurable {
    func configure(_ text: NSAttributedString)
}

class UILabelCollectionViewCell: UICollectionViewCell, Configurable {
    var benchMark = Benchmark()
    @IBOutlet weak var label: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        benchMark.finish()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.textColor = UIColor.lightGray
    }
    
    func configure(_ text: NSAttributedString) {
        benchMark.start()
        label.attributedText = text
    }
}

class AttributedCollectionViewCell: UICollectionViewCell, Configurable {
    var benchMark = Benchmark()
    @IBOutlet weak var label: AttributedLabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        benchMark.finish()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
    }
    
    func configure(_ text: NSAttributedString) {
        benchMark.start()
        label.attributedText = text
    }
}

class CollectionViewController: UIViewController, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
    }
    
    private func contentAttributeText() -> NSMutableAttributedString {
        let number = String(arc4random_uniform(100))
        let content = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        let string = "\(number)   \(content)"
        let rangeOfMinutes = (string as NSString).range(of: number)
        let attributedString = NSMutableAttributedString(string: string as String)
        
        attributedString.setAttributes([NSForegroundColorAttributeName: UIColor.black], range: rangeOfMinutes)
        return attributedString
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 300
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        if let labelCell = cell as? Configurable {
            labelCell.configure(contentAttributeText())
        }
        return cell
    }
}
