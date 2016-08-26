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
    
    var day: Int!;
    var manager: RETableViewManager!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.manager = RETableViewManager(tableView: self.tableView!);
        
        if ((NSUserDefaults.standardUserDefaults().stringForKey("klass")?.isEmpty == false) && (NSUserDefaults.standardUserDefaults().stringForKey("school")?.isEmpty == false)) {
            
            //self.startLoading();
            
            NSURLConnection.sendAsynchronousRequest(NSURLRequest.init(URL: NSURL.init(string: "http://alite.am/schema/getjson.php?week=" + String(NSUserDefaults.standardUserDefaults().integerForKey("week")) + "&scid=" + String(NSUserDefaults.standardUserDefaults().stringForKey("school")!) + "&clid=" + String(NSUserDefaults.standardUserDefaults().stringForKey("klass")!) + "&day=" + String(self.day) + "&getweek=0")!), queue: NSOperationQueue.mainQueue(), completionHandler: {(response:NSURLResponse?, data:NSData?, error:NSError?) -> Void in
                
                if ((error == nil) && (data != nil)) {
                    
                    do {
                        let lessonsArray = (try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary).objectForKey("lessons");
                        
                        //self.stopLoading();
                        
                        let section = RETableViewSection();
                        
                        for lesson in lessonsArray as! [NSDictionary] {
                            
                            let item = RETableViewItem(title: String(lesson.objectForKey("info")!), accessoryType: UITableViewCellAccessoryType.None, selectionHandler: {(item:RETableViewItem!) -> Void in
                                self.tableView.deselectRowAtIndexPath(item.indexPath(), animated: true);
                            });
                            
                            section.addItem(item);
                        }
                        
                        self.manager.addSection(section);
                        
                    } catch {
                        print("error");
                    }
                    
                }
            });
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
