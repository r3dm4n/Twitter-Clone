//
//  HomeDatasource.swift
//  Twitter-Clone
//
//  Created by r3d on 02/05/2017.
//  Copyright © 2017 r3d. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    
    let users:[User] = {
        let alexUser = User(name: "r3dm4n", username: "@alexandrucorut", bioText: "iPhone, iPad, iOS Programmy Community. Join to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        let gradiUser = User(name: "Gradinita Alex", username: "@gradialex", bioText: "Private Kindergarten in Galati, Romania", profileImage: #imageLiteral(resourceName: "gradi_profile_image"))
        
        
        return [alexUser, gradiUser]
    }()
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
}
