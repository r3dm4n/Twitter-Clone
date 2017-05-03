//
//  HomeDataSourceController.swift
//  Twitter-Clone
//
//  Created by r3d on 02/05/2017.
//  Copyright © 2017 r3d. All rights reserved.
//

import LBTAComponents

class HomeDataSourceController: DatasourceController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarItems()

        let homeDataSource = HomeDataSource()
        self.datasource = homeDataSource
    }


       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if let user = self.datasource?.item(indexPath) as? User {
//            user.bioText
            //cell height based on user.bioText

            let aproximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: aproximateWidthOfBioTextView, height: 1000)
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)

            ]

            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)

            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }


        return CGSize(width: view.frame.width, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }

}
