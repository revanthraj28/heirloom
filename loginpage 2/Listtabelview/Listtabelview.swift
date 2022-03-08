//
//  Listtabelview.swift
//  loginpage 2
//
//  Created by Codebele 07 on 04/03/22.
//

import UIKit

class Listtabelview: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var citynameLink: UILabel!
    @IBOutlet weak var link: UILabel!
    @IBOutlet weak var handImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        handImage.layer.cornerRadius = 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
