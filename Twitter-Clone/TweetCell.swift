//
//  TweetCell.swift
//  Twitter-Clone
//
//  Created by r3d on 04/05/2017.
//  Copyright © 2017 r3d. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        
        let profileImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = #imageLiteral(resourceName: "profile_image")
            imageView.layer.cornerRadius = 5
            imageView.clipsToBounds = true
            return imageView
        }()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)

        
        
    }
}
