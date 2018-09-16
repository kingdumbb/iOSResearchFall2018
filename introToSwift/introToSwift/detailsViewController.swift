//
//  detailsViewController.swift
//  introToSwift
//
//  Created by Fisal Alsabhan on 9/2/18.
//  Copyright © 2018 Fisal Alsabhan. All rights reserved.
//

import UIKit

class detailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contactLabel: UILabel!
    
    var titlePlaceholder: String = ""
    var contactPlaceholder: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = self.titlePlaceholder
        contactLabel.text = self.contactPlaceholder
        titleLabel.textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        // Do any additional setup after loading the view.
    }

 
    

}
