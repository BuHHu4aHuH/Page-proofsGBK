//
//  TotalUsersCell.swift
//  DesignApp
//
//  Created by Maksim Shershun on 4/8/19.
//  Copyright © 2019 Maksim Shershun. All rights reserved.
//

import UIKit

class TotalUsersCell: UICollectionViewCell {
    
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainView.layer.cornerRadius = 7
        setupProgressBar()
    }
    
    func setupProgressBar() {
        let headerView = Bundle.main.loadNibNamed(CircleProgressBar.identifier, owner:
            self, options: nil)?.first as? CircleProgressBar
        
        headerView?.userLabel.isHidden = true
        headerView?.radius = 34
        headerView?.blueLineWidth = 10
        headerView?.greyLineWidth = 8
        headerView?.setupProgressBar()
        
        headerView?.percentLabel.font = headerView?.percentLabel.font.withSize(10)
        
        if let headerView = headerView {
            progressBar.addSubview(headerView)
            progressBar.constrainToEdges(headerView)
        }
    }
}
