//
//  ScheduleViewController.swift
//  ALI-Schema
//
//  Created by Luka Janković on 25/08/16.
//  Copyright © 2016 ALI-Team. All rights reserved.
//

import UIKit
import SZLoadingTableViewController
import RETableViewManager

class ScheduleViewController: SZLoadingTableViewController {
    
    var manager: RETableViewManager!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.manager = RETableViewManager(tableView: self.tableView!);
        
        if ((NSUserDefaults.standardUserDefaults().stringForKey("klass")?.isEmpty == false) && (NSUserDefaults.standardUserDefaults().stringForKey("school")?.isEmpty == false)) {
            
            self.startLoading();
        }
            
        else {
            
            let info = RETableViewItem(title: "Var vänlig välj klass och / eller skola", accessoryType: UITableViewCellAccessoryType.None, selectionHandler: {(item:RETableViewItem!) -> Void in
                self.tableView.deselectRowAtIndexPath(item.indexPath(), animated: true);
            });
            
            let section = RETableViewSection();
            section.addItem(info);
            
            self.manager.addSection(section);
        }
    }
}
