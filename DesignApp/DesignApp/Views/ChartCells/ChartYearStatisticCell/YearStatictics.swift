//
//  YearStatictics.swift
//  DesignApp
//
//  Created by Maksim Shershun on 4/5/19.
//  Copyright © 2019 Maksim Shershun. All rights reserved.
//

import UIKit

class YearStatictics: UICollectionViewCell {

    @IBOutlet weak var whiteLine: UIView!
    @IBOutlet weak var blueLine: UIView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var blueLineHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        whiteLine.layer.cornerRadius = 5
        blueLine.layer.cornerRadius = 5
        yearLabel.addTextSpacing(spacing: 1)
    }
}
