//
//  HomeDataSourceController.swift
//  Twitter-Clone
//
//  Created by r3d on 02/05/2017.
//  Copyright © 2017 r3d. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDataSourceController: DatasourceController {

    //landscape
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)

        setupNavigationBarItems()

        Service.sharedInstance.fetchHomeFeed { (homeDatasource) in
            self.datasource = homeDatasource
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if let user = self.datasource?.item(indexPath) as? User {


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

        if section == 1 {
            return .zero
        }

        return CGSize(width: view.frame.width, height: 50)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }

}
