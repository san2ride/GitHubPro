//
//  ViewController.swift
//  GitHubPro2
//
//  Created by don't touch me on 6/23/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GithubAPIDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var followLabel: UILabel!
    
    @IBOutlet weak var folowerLabel: UILabel!
    
    @IBOutlet weak var gistLabel: UILabel!
    
    @IBOutlet weak var repoLabel: UILabel!
    
    
    let apiController = APIController()
    var imageURLString : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiController.delegate = self
        
        print("I just called viewDidload")
        
        self.apiController.fetchGithubuser("san2ride")
        
        
        func passDict(jsonDict: JSONDictionary) {
            
            print("I am in the view controller")
            
            if let avatarURL = jsonDict["avatar_url"] as? String {
                
                self.imageURLString = avatarURL
                
                self.getImageFromURLString(self.imageURLString)
                
            } else {
                print("I couldn't parse the avatar url")
            }
            
        }
        
    }
    
        func getImageFromURLString(urlString: String) {
            
            if let url = NSURL(string: urlString) {
                
                let session = NSURLSession.sharedSession()
                
                let task = session.dataTaskWithURL(url, completionHandler: {
                    (data, response, error) in
                    
                    if error != nil {
                        print(error?.localizedDescription)
                        return
                    }
                    
                    if let data = data {
                        
                        let image = UIImage(data: data)
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            
                            self.imageView.image = image
                            self.imageView.setNeedsLayout()
                        })
                        
                    }
                })
                task.resume()
            }
        
        
        
    }
    
    
    
    
}

        
        
        
    




