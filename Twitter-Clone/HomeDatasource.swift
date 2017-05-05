//
//  HomeDatasource.swift
//  Twitter-Clone
//
//  Created by r3d on 02/05/2017.
//  Copyright © 2017 r3d. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDataSource: Datasource, JSONDecodable {

    let users: [User]

    required init(json: JSON) throws {
        var users = [User]()

        let array = json["users"].array
        for userJson in array! {
            let name = userJson["name"].stringValue
            let username = userJson["username"].stringValue
            let bio = userJson["bio"].stringValue


            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())

            users.append(user)
        }
        self.users = users
    }

    let tweets: [Tweet] = {
        let alexUser = User(name: "r3dm4n", username: "@alexandrucorut", bioText: "iPhone, iPad, iOS Programmy Community. Join to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image"))

        let tweet = Tweet(user: alexUser, message: "Welcome to Twitter")
        let tweet2 = Tweet(user: alexUser, message: "This is the second tweet message for my Twitter Clone project")

        return [tweet, tweet2]
    }()

    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }

    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }

    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }

    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }

    override func numberOfSections() -> Int {
        return 2
    }

    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
}
