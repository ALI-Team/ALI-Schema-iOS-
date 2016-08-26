//
//  MainViewController.swift
//  ALI-Schema
//
//  Created by Luka Janković on 25/08/16.
//  Copyright © 2016 ALI-Team. All rights reserved.
//

import UIKit
import MSSTabbedPageViewController

class MainViewController: MSSTabbedPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
        self.tabBarView!.tabStyle = MSSTabStyle.Text;
        self.tabBarView?.sizingStyle = MSSTabSizingStyle.Distributed;
        self.tabBarView?.tintColor = UIColor(red:0.00, green:0.59, blue:0.53, alpha:1.0);
    }
    
    override func viewControllersForPageViewController(pageViewController: MSSPageViewController) -> [UIViewController]? {
        
        let days = [].mutableCopy();
        
        for _ in 1...5 {
            
            let schedule = self.storyboard?.instantiateViewControllerWithIdentifier("schedule");
            days.addObject(schedule);
        }
        
        return days as? [UIViewController];
    }
    
    override func tabBarView(tabBarView: MSSTabBarView, populateTab tab: MSSTabBarCollectionViewCell, atIndex index: Int) {
        
        switch index {
        case 0:
            tab.title = "Mån";
        case 1:
            tab.title = "Tis";
        case 2:
            tab.title = "Ons";
        case 3:
            tab.title = "Tors";
        case 4:
            tab.title = "Fre";
        default: break
            
        }
    }
}