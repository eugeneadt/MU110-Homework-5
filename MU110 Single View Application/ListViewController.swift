//
//  ViewController.swift
//  MU110 Single View Application
//
//  Created by Женя on 09.09.14.
//  Copyright (c) 2014 iOS Lab. All rights reserved.
//

import UIKit
import Alamofire

class ListViewController: UITableViewController {
    
    var items: NSArray?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Лекции"
        
        /*
        //if (!user.isLogedIn) {
       
       // }
      */
        
        
        
        Alamofire.request(.GET, "http://weekly.master-up.net/api/v1/lecture/list/").responseJSON {
            (request, response, JSON, error) -> Void in
            
            println(JSON)
            
            self.items = JSON as NSMutableArray
            
            self.tableView.reloadData()
            
            
        }
        
    }
    
    func showLoginController() {
        let loginController: UIViewController = UIStoryboard(name: "Authentication", bundle: nil).instantiateInitialViewController() as UIViewController
        
        
        navigationController!.presentViewController(loginController, animated: false, completion: nil)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if let count = self.items?.count {
            
            return count
            
        } else {
            
            return 0
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        
        if let item = self.items {
            
            let dictionary = item[indexPath.row] as NSDictionary
            
            cell.textLabel?.text = dictionary["name"] as NSString
        }
        
        return cell
        
        
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = items![indexPath.row] as NSDictionary
                (segue.destinationViewController as DetailViewController).detailItem = object
                
                
            }
        }
    }
    
    
    
}

