//
//  YearStatisticCell.swift
//  DesignApp
//
//  Created by Maksim Shershun on 3/31/19.
//  Copyright © 2019 Maksim Shershun. All rights reserved.
//

import UIKit

class YearStatisticCell: UICollectionViewCell {
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var foregroungView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var blueLineConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        foregroungView.layer.cornerRadius = 2
        blueView.layer.cornerRadius = 2
    }
}
