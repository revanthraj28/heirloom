//
//  File.swift
//  loginpage 2
//
//  Created by Codebele 07 on 09/03/2022.
//

import Foundation
import UIKit

class Passingdata : UIViewController {
    
    
    @IBOutlet weak var dataImage: UIImageView!
    @IBOutlet weak var dataLbl: UILabel!
    var getData : call? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("My data = \(getData)")
        dataLbl.text = getData?.titelLbl
        dataImage.image = UIImage(named: getData?.image ?? "")
    }
    
}
