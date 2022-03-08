//
//  Loginpage.swift
//  loginpage 2
//
//  Created by Codebele 07 on 02/03/22.
//

import UIKit

class Loginpage: UIViewController {
    
    var getUserEmail = String()
    
    @IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailLabel.text = getUserEmail
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
