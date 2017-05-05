//
//  User.swift
//  Twitter-Clone
//
//  Created by r3d on 03/05/2017.
//  Copyright © 2017 r3d. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User {
    let name: String
    let username: String
    let bioText: String
    let profileImage: UIImage
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImage = UIImage()
        
    }
}
