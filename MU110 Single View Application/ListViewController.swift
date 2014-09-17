//
//  ViewController.swift
//  MU110 Single View Application
//
//  Created by Женя on 09.09.14.
//  Copyright (c) 2014 iOS Lab. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    var lectureList:NSArray?{
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Лекции"
        
        loadDataFromServer()
        
    }
    
    
    @IBAction func logout(sender: AnyObject) {
        
       showLoginController ()
        
    }
    
    
    func loadDataFromServer () {
        
        
        WeeklyAPI.sharedInstance.getAllLectures { (Lectures) -> () in
            
            println(Lectures)
            
            self.lectureList = Lectures
           // self.tableView.reloadData()
        }
        
    }
    
    
    
    func showLoginController() {
        let loginController: UIViewController = UIStoryboard(name: "Authentication", bundle: nil).instantiateInitialViewController() as UIViewController
        
        navigationController!.presentViewController(loginController, animated: true, completion: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if let _list:NSArray = lectureList {
            return _list.count
        }
        
        return 0
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        
        if let _list:NSArray = lectureList {
            let _lectureItem = _list[indexPath.row] as Lecture;
            cell.textLabel?.text = _lectureItem.name
        }
        
        return cell
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            
            if let indexPath = tableView.indexPathForSelectedRow() {
                
                if let _list: NSArray = lectureList {
                    let _lectureItem = _list[indexPath.row] as Lecture
                    (segue.destinationViewController as DetailViewController).detailItem = _lectureItem
                }
                
            }
        }
        
    }
    
    
}
