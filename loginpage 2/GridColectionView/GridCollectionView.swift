//
//  GridCollectionView.swift
//  loginpage 2
//
//  Created by Codebele 07 on 08/03/2022.
//

import UIKit

class GridCollectionView: UICollectionViewCell {

    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelView.textColor = UIColor.white
        labelView.layer.masksToBounds = false
        labelView.layer.shadowOffset = CGSize(width: -1, height: 1)
        labelView.layer.shadowRadius = 3
        labelView.layer.shadowOpacity = 1
        labelView.layer.shadowColor = UIColor.black.cgColor
        labelView.font = UIFont(name: "OpenSans-SemiBold", size: 10)
    }
}
