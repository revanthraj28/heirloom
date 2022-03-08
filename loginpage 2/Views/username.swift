//
//  username.swift
//  loginpage 2
//
//  Created by Codebele 07 on 24/02/22.
//

import UIKit

class username: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeview()
    }
        func customizeview() {
            layer.cornerRadius = 5.0
            
  
            if let p = placeholder{
                let place = NSAttributedString(string: p, attributes: [.foregroundColor:UIColor.gray])
                attributedPlaceholder = place
                textColor = UIColor.white
            }
}
}
