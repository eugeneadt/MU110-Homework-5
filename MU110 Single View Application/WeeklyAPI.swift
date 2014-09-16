//
//  WeeklyAPI.swift
//  MU110 Single View Application
//
//  Created by Женя on 16.09.14.
//  Copyright (c) 2014 iOS Lab. All rights reserved.
//

import UIKit
import Alamofire


class WeeklyAPI: NSObject {
    
    class var sharedInstance: WeeklyAPI {
        
    struct Static {
        static var onceToken: dispatch_once_t = 0
        static var instance: WeeklyAPI? = nil
        }
        
        dispatch_once( &Static.onceToken, { () -> Void in
            Static.instance = WeeklyAPI()
            
        })
        return Static.instance!
    }
    
    func getAllLectures (Result: (NSArray?) -> Void ) {
        
        //  Alamofire.request(.GET, "http://weekly.master-up.net/api/v1/lecture/list/").responseJSON {
        //      (request, response, JSON, error) -> Void in
        
        //      println(JSON)
        
        //   self.items = JSON as NSMutableArray
        
        // self.tableView.reloadData()
        
        
        Alamofire.request(.GET, "http://weekly.master-up.net/api/v1/lecture/list/").responseJSON {
            (request, response, JSON, error) in
            
            var _lectureList:NSMutableArray = []
            if let _JSON:NSArray = JSON as? NSArray
            {
                for _object in _JSON
                {
                    let _lecture = Lecture()
                    let _obj:NSDictionary = _object as NSDictionary
                    
                    _lecture.name = _obj["name"] as? String
                    _lecture.descr = _obj["description"] as? String
                    _lecture.image = _obj["image"] as? String
                    _lecture.video = _obj["video"] as? String
                    _lecture.date = _obj["data"] as? String
                    
                    _lectureList.addObject(_lecture)
                    
                }
                
                Result (_lectureList)
            }
            
            
            
            
            
        }
        
        
        
    }
    
    
}























