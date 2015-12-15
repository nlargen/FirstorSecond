//
//  MainScreenIC.swift
//  First or Next
//
//  Created by Nicholas Largen on 12/15/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import UIKit
import Parse
import ParseTwitterUtils
import ParseFacebookUtilsV4
class MainScreenIC: UIViewController
{
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBAction func CreateButtonPressed(sender: AnyObject)
    {
        let rgvc = self.storyboard?.instantiateViewControllerWithIdentifier("RegisterVC") as! RegisterVC
        self.presentViewController(rgvc, animated: true, completion: nil)
    }
    
    @IBAction func LoginButtonPressed(sender: AnyObject)
    {
        PFUser.logInWithUsernameInBackground(usernameTF.text!, password: passwordTF.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil
            {
                
                print("login successful")
                UserDataSingleton.currentuser = PFUser.currentUser()
                let divc = self.storyboard?.instantiateViewControllerWithIdentifier("UserHomePageVC") as! UserHomePageVC
                self.presentViewController(divc, animated: true, completion: nil)
                
                // Do stuff after successful login.
            } else
            {
                // The login failed. Check error to see why.
            }
        }
    }
    
    @IBAction func FacebookLoginButtonPressed(sender: AnyObject)
    {
       
    }
    @IBAction func TwitterLoginButton(sender: AnyObject)
    {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        self.usernameTF.becomeFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
