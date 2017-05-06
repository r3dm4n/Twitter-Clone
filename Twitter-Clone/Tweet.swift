//
//  Tweet.swift
//  Twitter-Clone
//
//  Created by r3d on 04/05/2017.
//  Copyright © 2017 r3d. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct Tweet: JSONDecodable {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        
        self.message = json["message"].stringValue
    }
}
