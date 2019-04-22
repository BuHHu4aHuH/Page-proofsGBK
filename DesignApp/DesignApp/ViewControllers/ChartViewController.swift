//
//  ChartViewController.swift
//  DesignApp
//
//  Created by Maksim Shershun on 4/5/19.
//  Copyright © 2019 Maksim Shershun. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var userStatisticsView: UIView!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var chartTypeView: UIView!
    
    @IBOutlet weak var chartTypeLabel: UILabel!
    @IBOutlet weak var chartUsersLabel: UILabel!
    @IBOutlet weak var yearsLabel: UILabel!
    @IBOutlet weak var totalUsersLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    
    let yearsArray = ["2012","2013","2014","2015","2016","2017","2018"]
    let multiplierArray = [0.4, 0.2, 0.95, 0.4, 0.8, 0.3, 0.5]
    
    @IBOutlet weak var userStatisticsTextLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
        setupStatisticsView()
        setupLabelsSpacing()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1843137255, alpha: 1)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func setupLabelsSpacing() {
        chartTypeLabel.addTextSpacing(spacing: 1)
        
        chartUsersLabel.addTextSpacing(spacing: 0.64)
        yearsLabel.addTextSpacing(spacing: 1.28)
        
        totalUsersLabel.addTextSpacing(spacing: 1)
        
        targetLabel.addTextSpacing(spacing: 1.12)
        currentLabel.addTextSpacing(spacing: 1.12)
        
        chartTypeView.layer.cornerRadius = 10
        
        userStatisticsTextLabel.addTextSpacing(spacing: 0.32)
    }
    
    private func setupStatisticsView() {
        userStatisticsView.layer.cornerRadius = 13
        
        let headerView = Bundle.main.loadNibNamed(CircleProgressBar.identifier, owner:
            self, options: nil)?.first as? CircleProgressBar
        
        headerView?.radius = 60
        headerView?.blueLineWidth = 15
        headerView?.greyLineWidth = 12
        headerView?.setupProgressBar()
        
        headerView?.percentLabel.font = headerView?.percentLabel.font.withSize(20)
        headerView?.userLabel.font = headerView?.userLabel.font.withSize(10)
        
        if let headerView = headerView {
            progressBar.addSubview(headerView)
            progressBar.constrainToEdges(headerView)
        }
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nibName = UINib(nibName: YearStatictics.identifier, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: YearStatictics.identifier)
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}

extension ChartViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yearsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YearStatictics.identifier, for: indexPath) as! YearStatictics
        
        cell.yearLabel.text = yearsArray[indexPath.item]
        
        let newConstraint = cell.blueLineHeightConstraint.constraintWithMultiplier(CGFloat(multiplierArray[indexPath.item]))
        cell.whiteLine.removeConstraint(cell.blueLineHeightConstraint)
        cell.blueLineHeightConstraint = newConstraint
        cell.whiteLine.addConstraint(cell.blueLineHeightConstraint)
        cell.whiteLine.layoutIfNeeded()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return (UIScreen.main.bounds.width - 267) / 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return (UIScreen.main.bounds.width - 267) / 6
    }
}
