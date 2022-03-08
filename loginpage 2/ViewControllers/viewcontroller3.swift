//
//  File.swift
//  loginpage 2
//
//  Created by Codebele 07 on 24/02/22.
//

import UIKit

class viewcontroller3 : UIViewController {
    
    @IBOutlet weak var createemail: UITextField!
    @IBOutlet weak var createpassword: Createpassword!
    var onclick = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createemail.delegate = self
        createpassword.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        self.createemail.addBottomBorderLineColor(color:UIColor.gray, width: 1.0)
        self.createpassword.addBottomBorderLineColor(color:UIColor.gray, width: 1.0)
}
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func createpasswordshowBtn(_ sender: Any) {
        if(onclick==true){
            (sender as AnyObject).setTitle("hide", for: .normal)
            createpassword.isSecureTextEntry = false
        }else{
            (sender as AnyObject).setTitle("show", for: .normal)
            createpassword.isSecureTextEntry = true
        }
        onclick = !onclick
        
    }
    
    @IBAction func createaccountBTn(_ sender: Any) {
        if isvalidEmail(createemail.text ?? "revanth") == true {
            print("valid")
            if (createemail.text != "") && (createpassword.text != "") {
               print("success")
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                nextViewController.createuserEmial = createemail.text ?? ""
                self.present(nextViewController, animated:true, completion:nil)
            } else {
                showAlert(message: "invalid email")
        }
        
        } else {
            showAlert(message: "fill the empty textfield")
        }
    }
    //dismiss of keybord when you tap of outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func isvalidEmail(_ email:String) ->Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
    }
    func showAlert(message : String) {
        let alert = UIAlertController(title: "Alert", message: message,preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert,animated: true,completion: nil)
    }
    
    
}
extension UIView {
    func addBottomBorderLineColor(color : UIColor,width : CGFloat)
    {
        let bottomBorderline = CALayer()
        bottomBorderline.backgroundColor = color.cgColor
        bottomBorderline.frame = CGRect(x: -1, y: self.frame.size.height  , width: 300, height: 1)
        self.layer.addSublayer(bottomBorderline)
    }
}
extension viewcontroller3: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
