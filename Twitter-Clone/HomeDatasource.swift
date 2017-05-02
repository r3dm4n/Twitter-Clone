//
//  HomeDatasource.swift
//  Twitter-Clone
//
//  Created by r3d on 02/05/2017.
//  Copyright © 2017 r3d. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    
    
    let words = ["user1", "user2", "user3"]
    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.item]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
}
