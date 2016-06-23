//
//  GitHubFriend.swift
//  GitHubProApp
//
//  Created by don't touch me on 6/21/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class GitHubFriend: NSObject {

    var username: String = ""
    var gitID: Int = 0
    var avatarURL: String = ""
    var followersURL: String = ""
    var followingURL: String = ""
    var email: String = ""
    var publicRepos: Int = 0
    var publicGists: Int = 0
    var createdAT = NSDate()
    
    init(jsonDict: JSONDictionary) {
        
        
        
        if let username = jsonDict["username"] as? String {
            self.username = username
        } else {
            print("i could not parse the username")
        }

        if let gitID = jsonDict["id"] as? Int {
            self.gitID = gitID
        } else {
            print("i could not parse the id")
        }

        if let avatarURL = jsonDict["avatar_url"] as? String {
            self.avatarURL = avatarURL
        } else {
            print("i could not parse the avatar_url")
        }
        
        if let followersURL = jsonDict["followers_url"] as? String {
            self.followersURL = followersURL
        } else {
            print("i could not parse the username")
        }

        if let followingURL = jsonDict["following_url"] as? String {
            self.followingURL = followingURL
        } else {
            print("i could not parse the following_url")
        }
        
        if let email = jsonDict["email"] as? String {
            self.email = email
        } else {
            print("i could not parse the email")
        }
        
        if let publicRepos = jsonDict["public_repos"] as? Int {
            self.publicRepos = publicRepos
        } else {
            print("i could not parse the public_repos")
        }
        
        if let publicGists = jsonDict["public_gists"] as? Int {
            self.publicGists = publicGists
        } else {
            print("i could not parse the public_gists")
        }
        
        if let createdAT = jsonDict["created_at"] as? String {
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            
            self.createdAT = dateFormatter.dateFromString(createdAT)!
            
        } else {
            print("i could not parse the created_at")
        }

    }
    
    
    
    
}
