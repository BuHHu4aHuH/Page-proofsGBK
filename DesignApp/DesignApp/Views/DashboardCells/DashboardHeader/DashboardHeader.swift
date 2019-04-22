//
//  DashboardHeader.swift
//  DesignApp
//
//  Created by Maksim Shershun on 3/30/19.
//  Copyright © 2019 Maksim Shershun. All rights reserved.
//

import UIKit

class DashboardHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var userStatisticsCollectionView: UICollectionView!
    @IBOutlet weak var yearsStatisticsCollectionView: UICollectionView!
    
    let yearsArray = ["2012","2013","2014","2015","2016","2017","2018"]
    let multiplierArray = [0.4, 0.2, 0.95, 0.4, 0.8, 0.3, 0.5]
    
    let spacingBetweenCollectionViewCells: CGFloat = 17
    var yearsSpacing: CGFloat {
        return yearsArray.isEmpty ? 0 : CGFloat(yearsArray.count - 1)
    }
    let cellIndents: CGFloat = 58
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        yearsStatisticsCollectionView.delegate = self
        yearsStatisticsCollectionView.dataSource = self
        
        userStatisticsCollectionView.delegate = self
        userStatisticsCollectionView.dataSource = self
        
        let yearsNib = UINib(nibName: YearStatisticCell.identifier, bundle: nil)
        yearsStatisticsCollectionView.register(yearsNib, forCellWithReuseIdentifier: YearStatisticCell.identifier)
        
        let nibName = UINib(nibName: TotalUsersCell.identifier, bundle: nil)
        userStatisticsCollectionView.register(nibName, forCellWithReuseIdentifier: TotalUsersCell.identifier)
    }
}

extension DashboardHeader: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yearsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.yearsStatisticsCollectionView {
            let cell = yearsStatisticsCollectionView.dequeueReusableCell(withReuseIdentifier: YearStatisticCell.identifier, for: indexPath) as! YearStatisticCell
            
            cell.yearLabel.text = yearsArray[indexPath.item]
            
            let newConstraint = cell.blueLineConstraint.constraintWithMultiplier(CGFloat(multiplierArray[indexPath.item]))
            cell.foregroungView.removeConstraint(cell.blueLineConstraint)
            cell.blueLineConstraint = newConstraint
            cell.foregroungView.addConstraint(cell.blueLineConstraint)
            cell.foregroungView.layoutIfNeeded()
            
            return cell
        } else {
            let cell = userStatisticsCollectionView.dequeueReusableCell(withReuseIdentifier: TotalUsersCell.identifier, for: indexPath)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.userStatisticsCollectionView {
            return CGSize(width: UIScreen.main.bounds.width - cellIndents, height: 167)
        } else {
            return CGSize(width: 24, height: 34)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.userStatisticsCollectionView {
            return spacingBetweenCollectionViewCells
        } else {
            return (UIScreen.main.bounds.width - 226) / yearsSpacing
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.userStatisticsCollectionView {
            return spacingBetweenCollectionViewCells
        } else {
            return (UIScreen.main.bounds.width - 226) / yearsSpacing
        }
    }
    
}
