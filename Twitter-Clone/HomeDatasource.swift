//
//  HomeDatasource.swift
//  Twitter-Clone
//
//  Created by r3d on 02/05/2017.
//  Copyright © 2017 r3d. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {

    let users: [User] = {
        let alexUser = User(name: "r3dm4n", username: "@alexandrucorut", bioText: "iPhone, iPad, iOS Programmy Community. Join to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image"))

        let gradiUser = User(name: "Gradinita Alex", username: "@gradialex", bioText: "Private Kindergarten in Galati, Romania. 'Preparing Children for Success in Life!'", profileImage: #imageLiteral(resourceName: "gradi_profile_image"))

        let appleUser = User(name: "Apple", username: "@Apple", bioText: "Macbook Pro with Touchbar. A revolutionary new way to use your Mac. The Touch Bar replaces the function keys that have long occupied the top of your keyboard with something much more versatile and capable.2 It changes automatically based on what you’re doing to show you relevant tools you already know how to use — system controls like volume and brightness, interactive ways to adjust or browse through content, intelligent typing features like emoji and predictive text, and more. And for the first time, Touch ID is available on a Mac enabling instant access to logins and so much more.", profileImage: #imageLiteral(resourceName: "apple_profile_image"))


        return [alexUser, gradiUser, appleUser]
    }()

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
