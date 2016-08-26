//
//  SettingsViewController.swift
//  ALI-Schema
//
//  Created by Luka Jankovic on 26/08/16.
//  Copyright © 2016 ALI-Team. All rights reserved.
//

import UIKit
import RETableViewManager

class SettingsViewController: UITableViewController {

    var manager:RETableViewManager!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.title = "Inställningar";
        
        self.manager = RETableViewManager(tableView: self.tableView);
        
        let general = RETableViewSection(headerTitle: "Allmänt");
        
        let school = RERadioItem(title: "Skola", value: "Ingen", selectionHandler: {(item:RERadioItem!) -> Void in
            
            self.tableView.deselectRowAtIndexPath(item.indexPath(), animated: true);
            
            if let jsonData = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("schools", ofType: "json")!) {
            
                do {
                    if let schoolList: NSArray = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as? NSArray {
                        
                        let list:NSMutableArray = [];
                        
                        for school in schoolList as! [NSDictionary] {
                            
                            let namn:String = school["namn"] as! String;
                            let stad:String = school["stad"] as! String;
                            
                            list.addObject(namn + " (" + stad + ")");
                        }
                        
                        let optionsController = RETableViewOptionsController(item: item, options:list as [AnyObject], multipleChoice:false, completionHandler:{(selectedItem:RETableViewItem!) -> Void in
                            NSUserDefaults.standardUserDefaults().setObject(schoolList.objectAtIndex(selectedItem.indexPath().row).objectForKey!("id"), forKey: "school");
                            item.reloadRowWithAnimation(UITableViewRowAnimation.None);
                        });
                        
                        self.navigationController?.pushViewController(optionsController, animated: true);
                    }
                } catch let error as NSError {
                    print(error);
                }
            }
        });
        
        let klass = RETextItem(title: "Klass", value: "Ingen");
        
        klass.onChange = {(item:RETextItem!) -> Void in
            NSUserDefaults.standardUserDefaults().setObject(item.value, forKey: "klass");
            NSUserDefaults.standardUserDefaults().synchronize();
        }
        
        general.addItem(school);
        
        general.addItem(klass)
        
        self.manager.addSection(general);
    }
    
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                return try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
    
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
}
