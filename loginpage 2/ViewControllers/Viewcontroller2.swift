//
//  Viewcontroller2.swift
//  loginpage 2
//
//  Created by Codebele 07 on 24/02/22.
//

import UIKit

class viewcontroller2 : UIViewController {
    
    @IBOutlet weak var fullname: UITextField!
    @IBOutlet weak var companyname: UITextField!
    @IBOutlet weak var yourrole: UITextField!
    @IBOutlet weak var companyaddress: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var Zip: UITextField!
    @IBOutlet weak var phonenumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phonenumber.delegate = self
        fullname.delegate = self
        companyname.delegate = self
        city.delegate = self
        Zip.delegate = self
        yourrole.delegate = self
        
        
        }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func contniueBtn(_ sender: Any) {
        
        if (fullname.text != "") && (companyname.text != "") && (yourrole.text != "") && (companyaddress.text != "") && (city.text != "") &&
            (Zip.text != "") && (phonenumber.text != ""){
            print("Sucess")
        } else {
            showAlert(message: "field is empty")
        }
        let main = UIStoryboard(name: "Main", bundle: nil)
            let secound = main.instantiateViewController(withIdentifier: "thirdVC")
            self.present(secound, animated: true, completion: nil)
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        self.fullname.addBottomBorderLineWith(color:UIColor.gray, width: 1.0)
        self.companyname.addBottomBorderLineWith(color:UIColor.gray, width: 1.0)
        self.yourrole.addBottomBorderLineWith(color:UIColor.gray, width: 1.0)
        self.companyaddress.addBottomBorderLineWith(color:UIColor.gray, width: 1.0)
        self.city.addBottomBorderLineWith(color:UIColor.gray, width: 1.0)
        self.Zip.addBottomBorderLineWith(color:UIColor.gray, width: 1.0)
        self.phonenumber.addBottomBorderLineWith(color:UIColor.gray, width: 1.0)
    
    }
    func showAlert(message : String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil )
    }
    //dismiss of keybord when you tap of outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //For mobile numer validation
        if textField == phonenumber{
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    
}
extension UIView {
    func addBottomBorderLineWith(color: UIColor,width : CGFloat)
    {
        let bottomBorderline = CALayer()
        bottomBorderline.backgroundColor = color.cgColor
        bottomBorderline.frame = CGRect(x: -1, y: self.frame.size.height  , width: self.frame.size.width , height: 1)
        self.layer.addSublayer(bottomBorderline)
    }
}
extension viewcontroller2: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}

