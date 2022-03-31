//
//  Delegate.swift
//  loginpage 2
//
//  Created by Codebele 07 on 09/03/2022.
//

import Foundation
import UIKit


class Delegate : UIViewController {
    
    @IBOutlet weak var mianImage: UIImageView!
    @IBOutlet weak var baseScreen: UILabel!
    @IBOutlet weak var chooseaSide: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "Protocolcell") as! Protocolcell
        selectionVC.selectionDelegate = self
        present(selectionVC, animated: true, completion: nil)
    }
}

extension Delegate : SideSelectionDelegate {
    
    func didTapChoice(image: UIImage, name: String, color: UIColor) {
        mianImage.image = image
        baseScreen.text = name
        view.backgroundColor = color
    }
    
}
