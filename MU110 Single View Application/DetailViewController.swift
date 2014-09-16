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
    
    var detailItem: Lecture? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail: Lecture = self.detailItem {
            
            if let label = self.detailDescriptionLabel {
                label.text = detail.descr
                detailDate.text = detail.date
                self.navigationItem.title = detail.name
            }
            
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
