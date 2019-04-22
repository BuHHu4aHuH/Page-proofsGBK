//
//  ViewController.swift
//  DesignApp
//
//  Created by Maksim Shershun on 3/30/19.
//  Copyright © 2019 Maksim Shershun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func registerPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegisterViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func dashboardPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DashboardNavigation")
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func chartPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChartViewController")
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
}

