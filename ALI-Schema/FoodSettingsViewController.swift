//
//  FoodSettingsViewController.swift
//  ALI-Schema
//
//  Created by Luka Janković on 27/08/16.
//  Copyright © 2016 ALI-Team. All rights reserved.
//

import UIKit
import RETableViewManager

class FoodSettingsViewController: UITableViewController {

    var manager: RETableViewManager!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        manager = RETableViewManager(tableView: self.tableView);
    }
    
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
}
