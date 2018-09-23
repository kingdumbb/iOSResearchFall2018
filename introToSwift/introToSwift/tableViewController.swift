//
//  tableViewController.swift
//  introToSwift
//
//  Created by Luan Pham on 9/23/18.
//  Copyright © 2018 Fisal Alsabhan. All rights reserved.
//

import UIKit

class tableViewController: UITableViewController {

    private let dataSource = DataSource()
    
    //MARK: - UITableViewDataSource
    override func viewDidLoad() {
        
        dataSource.movies = ["Terminator","Back To The Future","The Dark Knight"]
        tableView.dataSource = dataSource
        
}
}
