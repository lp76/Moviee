//
//  APIManager.swift
//  Moviee
//
//  Created by Luca Peduto on 19/03/16.
//  Copyright © 2016 Eloquent Bit. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(urlString:String, completion: [Movies] -> Void) {
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> Void in
            
            if error != nil {
                print(error!.localizedDescription)
            } else {
                
                do {
                    
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? JSONDictionary,
                        feed = json["feed"] as? JSONDictionary,
                        entries = feed["entry"] as? JSONArray {
                            
                            var movies = [Movies]()
                            for entry in entries {
                                let entry = Movies(data: entry as! JSONDictionary)
                                movies.append(entry)
                            }
                            
                            let i = movies.count
                            print("iTunesApiManager - total count --> \(i)")
                            print(" ")
                            
                            let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                                dispatch_async(dispatch_get_main_queue()){
                                    completion(movies)
                                }
                            }
                    }
                    
                } catch {
                    dispatch_async(dispatch_get_main_queue()) {
                        print("error in NSJSONSerialization")
                    }
                }
            }
        }
        
        task.resume()
        
    }
}
