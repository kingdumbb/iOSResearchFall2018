//
//  dataSource.swift
//  introToSwift
//
//  Created by Luan Pham on 9/23/18.
//  Copyright © 2018 Fisal Alsabhan. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource {
    
    var movies = [String]()
    
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid")!
        
        cell.textLabel?.text = movies[indexPath.row]
        cell.imageView?.image = UIImage(named: "movie")
        cell.imageView?.startAnimating()
        
        return cell
    }
    
}
