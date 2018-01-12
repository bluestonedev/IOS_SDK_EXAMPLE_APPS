//
//  ViewController.swift
//  Authentication
//
//  Copyright © 2016 SAP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var infoLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.infoLabel.text = "Logon against HCPms was successful"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

