//
//  LoginViewController.swift
//  GrifolsLogin
//
//  Created by Alejandro Palomo Rodriguez on 24/5/16.
//
//

import UIKit
import RealmSwift

@IBDesignable public class LoginView: UIView {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    public override func awakeFromNib() {
        print("Login component")
        super.awakeFromNib()
        xibSetup()
        print("1:\(Realm.Configuration.defaultConfiguration.fileURL!)")
        alejandro()
    }
    
    var view: UIView!
    func xibSetup(){
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "LoginView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }

    public func alejandro() {
        print("Esta es la funcion publica alejandro: \(UserController.sharedInstance.loggedUser())")
    }
    
    public func configureView() {
        let borderUser = CALayer()
        let borderPass = CALayer()
        let width = CGFloat(1.0)
        
        borderUser.borderColor = UIColor.whiteColor().CGColor
        borderPass.borderColor = UIColor.whiteColor().CGColor
        
        //User
        borderUser.frame = CGRect(x: 0, y: txtUser.frame.size.height - width, width:  txtUser.frame.size.width, height: txtUser.frame.size.height)
        
        borderUser.borderWidth = width
        txtUser.layer.addSublayer(borderUser)
        txtUser.layer.masksToBounds = true
        
        txtUser.attributedPlaceholder = NSAttributedString(string:"User",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        //Password
        borderPass.frame = CGRect(x: 0, y: txtPassword.frame.size.height - width, width:  txtPassword.frame.size.width, height: txtPassword.frame.size.height)
        borderPass.borderWidth = width
        txtPassword.layer.addSublayer(borderPass)
        txtPassword.layer.masksToBounds = true
        
        txtPassword.attributedPlaceholder = NSAttributedString(string:"Password",attributes:[NSForegroundColorAttributeName:UIColor.whiteColor()])
        
        btnLogin.layer.cornerRadius = 8.0
        btnLogin.layer.masksToBounds = true
        btnLogin.layer.borderColor = UIColor.whiteColor().CGColor
        btnLogin.layer.borderWidth = 2
        
        
    }
    
    //MARK:-Send Login
    
    @IBAction func sendLogin(sender: UIButton) {
        LoginService.sharedInstance.signInWithUser(user: txtUser.text!, password: txtPassword.text!, completion: { () in
                print("Se ha completado")
            }) { (codeError, descriptionError) in
                print(codeError,descriptionError)
        }
    }

}
