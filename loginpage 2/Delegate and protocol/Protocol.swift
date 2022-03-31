//
//  Protocol.swift
//  loginpage 2
//
//  Created by Codebele 07 on 09/03/2022.
//

import Foundation
import UIKit

protocol SideSelectionDelegate {
    func didTapChoice(image: UIImage, name: String, color: UIColor)
}



class Protocolcell : UIViewController {
   
    
    var selectionDelegate: SideSelectionDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func darkWaderBtn(_ sender: Any) {
        selectionDelegate.didTapChoice(image: UIImage(named: "vader")!, name: "Darth Vader", color: .red)
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func luckSktwakerBtn(_ sender: Any) {
        selectionDelegate.didTapChoice(image: UIImage(named: "luke")!, name: "Luke Skywalker", color: .cyan)
        dismiss(animated: true, completion: nil)
        
    }
    
}

