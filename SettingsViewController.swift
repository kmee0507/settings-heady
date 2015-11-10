//
//  ViewController.swift
//  Settings
//
//  Created by kc mee on 11/2/15.
//  Copyright © 2015 kc mee. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    var toPass:String!
    
    var objects: NSMutableArray! = NSMutableArray()
    var objects1: NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.objects.addObject("Beer To Locate")
        self.objects.addObject("Color Scheme")
        self.objects.addObject("Change Username")
        self.objects.addObject("Logout")
        
        
        self.tableView.reloadData()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objects.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        
        cell.titleLabel.text = self.objects.objectAtIndex(indexPath.row) as? String
        
        
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showView", sender: self)
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showView")
        {
            var upcoming: NewViewController = segue.destinationViewController as! NewViewController
            
            let indexPath = self.tableView.indexPathForSelectedRow!
            
            let titleString = self.objects.objectAtIndex(indexPath.row) as? String
            
            upcoming.titleString = titleString
            
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
        }
        
    }
    
    
    
    
    
    
    
    


}

