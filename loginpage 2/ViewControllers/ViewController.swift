//
//  ViewController.swift
//  loginpage 2
//
//  Created by Codebele 07 on 24/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var requiredpassword: UILabel!
    @IBOutlet weak var required: UILabel!
    @IBOutlet weak var emailtextfield: UITextField!
    @IBOutlet weak var passwordtextfield: UITextField!
    var createuserEmial = String()
    var createuserpassword = String()
    var iconClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        required.isHidden = true
        requiredpassword.isHidden = true
        emailtextfield.text = createuserEmial
        passwordtextfield.text = createuserpassword
        emailtextfield.delegate = self
        passwordtextfield.delegate = self
        
        }
    //MARK: LOGIN ACTION
    @IBAction func logintonewVC(_ sender: UIButton) {
        
        if isValidEmail(emailtextfield.text ?? "revanth") == true {
            print("Valid")
            if(emailtextfield.text != "") && (passwordtextfield.text != ""){
                print("Sucess")
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Loginpage") as! Loginpage
                nextViewController.getUserEmail = emailtextfield.text ?? ""
                self.navigationController?.pushViewController(nextViewController, animated: true)
//                self.present(nextViewController, animated:true, completion:nil)
            } else {
                showAlert(message: "field is empty")
            }
            
        } else {
            showAlert(message: "invalid")
        }
        if isValidPassword(passwordtextfield.text!) {
            print("valid")
        }
        
    }
    //MARK: PASSWORD ACTION
    @IBAction func passwordEditingchangedAction(_ sender: Any) {
        
        if isValidPassword(passwordtextfield.text!) {
            requiredpassword.text = ""
            requiredpassword.isHidden = true
        } else {
            requiredpassword.isHidden = false
            requiredpassword.text = "invalid password"
        }
    }

    
   @IBAction func hidetherequiredButton(_ sender: Any) {
       
       if passwordtextfield.text?.count == 0 || isValidPassword(passwordtextfield.text ?? "") {
          requiredpassword.isHidden = true
           
       }
   }
    
    @IBAction func emailEditingChangedAction(_ sender: Any) {
        
        if isValidEmail(emailtextfield.text ?? "revanth") == true {
            
            required.text = ""
            required.isHidden = true
        } else {
            required.text = "invalid mail"
            required.isHidden = false
        }
        
    }
    
    @IBAction func showBtn(_ sender: UIButton) {

        if(iconClick == true) {
            sender.setTitle("hide", for: .normal)
            passwordtextfield.isSecureTextEntry = false
        } else {
            sender.setTitle("show", for: .normal)
            passwordtextfield.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    //TODO
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.emailtextfield.addBottomBorderLineWithColor(color: UIColor.gray, width: 1.0)
        self.passwordtextfield.addBottomBorderLineWithColor(color:UIColor.gray, width: 1.0)
         
    }
    
    func isValidPassword(_ password: String) -> Bool {
        // least one uppercase,
        // least one digit
        // least one lowercase
        // least one symbol
        //  min 8 characters total
        let password = password.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)

    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func showAlert(message : String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    //dismiss of keybord when you tap of outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

    extension UIView {
        func addBottomBorderLineWithColor(color : UIColor , width : CGFloat)
        {
            let bottomBorderline = CALayer()
            bottomBorderline.backgroundColor = color.cgColor
            bottomBorderline.frame = CGRect(x: -1, y: self.frame.size.height  , width: 350 , height: 1)
            self.layer.addSublayer(bottomBorderline)
        }
    }


//MARK: - TEXTFIELD EXTENSION
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}
