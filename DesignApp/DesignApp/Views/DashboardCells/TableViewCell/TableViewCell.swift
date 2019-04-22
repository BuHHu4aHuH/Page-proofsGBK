//
//  TableViewCell.swift
//  DesignApp
//
//  Created by Maksim Shershun on 4/1/19.
//  Copyright © 2019 Maksim Shershun. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var bottomLine: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
