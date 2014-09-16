//
//  LoginViewController.swift
//  MU110 Single View Application
//
//  Created by Женя on 16.09.14.
//  Copyright (c) 2014 iOS Lab. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var login: UIButton!

    @IBAction func goLogin(sender: AnyObject) {
        
        println("Test button press")
        
        //if (!user.isLogedIn) {
        let loginController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as UIViewController
        
        
        navigationController!.presentViewController(loginController, animated: true, completion: nil)
        //}
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
