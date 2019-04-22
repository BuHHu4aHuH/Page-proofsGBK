//
//  DashboardViewController.swift
//  DesignApp
//
//  Created by Maksim Shershun on 3/30/19.
//  Copyright © 2019 Maksim Shershun. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    private let priceArray = ["$2,029","$1,2","$1,1","$5,111","$2,1","$2,1"]
    private let daysArray = ["Januay 01","Januay 02","Januay 03","Januay 04","Januay 05","Januay 06"]
    
    let headerHeight: CGFloat = 362
    let headerView = (Bundle.main.loadNibNamed(DashboardHeader.identifier, owner: self, options: nil)![0] as? UIView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.tableHeaderView?.frame.size.height = headerHeight
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1843137255, alpha: 1)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableHeaderView = headerView
        
        let nibName = UINib(nibName: TableViewCell.identifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: TableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return priceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
        cell.selectionStyle = .none
        cell.dateLabel.text = daysArray[indexPath.item]
        cell.moneyLabel.text = priceArray[indexPath.item]
        
        if indexPath.item == 0 {
            cell.topLine.isHidden = true
        } else if (indexPath.item == priceArray.count - 1) {
            cell.bottomLine.isHidden = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 34
    }
}

extension DashboardViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == tableView {
            let a = scrollView.contentOffset
            if a.y <= 0 {
                scrollView.contentOffset = CGPoint.zero
            }
        }
    }
}
