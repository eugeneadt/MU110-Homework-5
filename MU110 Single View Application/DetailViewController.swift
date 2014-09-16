//
//  DetailViewController.swift
//  MU110 Single View Application
//
//  Created by Женя on 10.09.14.
//  Copyright (c) 2014 iOS Lab. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet weak var detailDate: UILabel!
    
    var detailItem: NSDictionary? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail: NSDictionary = self.detailItem {
            
            if let label = self.detailDescriptionLabel {
                label.text = detail["description"] as NSString
            }
            
            if let date = self.detailDate {
                date.text = detail["data"] as NSString
            }
            
            self.navigationItem.title = detail["name"] as NSString
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
