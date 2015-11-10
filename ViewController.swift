/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {
    //true if user is signing up
    var signupActive = true

    @IBOutlet weak var fldEmail: UITextField!
    @IBOutlet weak var fldUsername: UITextField!
    @IBOutlet weak var fldPassword: UITextField!

    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var btnEnterInfo: UIButton!
    @IBOutlet weak var txtRegistered: UILabel!
    @IBOutlet weak var btnSwitchScreen: UIButton!

    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    
    //this function will display an alert to the user when called
    func displayAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func settingsButton (sender: UIButton!) {
        
        performSegueWithIdentifier("nextView", sender: self)
        
    }
    
    @IBAction func btnRegister(sender: AnyObject) {
        //if fields are empty, return an error alert
        if fldEmail.text == "" {
            displayAlert("Missing Email", message: "Please enter an email address.")
        } else if fldUsername.text == "" {
            displayAlert("Missing Username", message: "Please enter a username.")
        } else if fldUsername.text?.characters.count < 5 || fldUsername.text?.characters.count > 15 {
            displayAlert("Insufficient Length", message: "Your Username must be between 5 and 15 characters long")
        }
          else if fldPassword.text == "" {
            displayAlert("Missing Password", message: "Please enter a password.")
        } else if fldPassword.text?.characters.count < 5 || fldPassword.text?.characters.count > 15 {
            displayAlert("Insufficient Length", message: "Your password must be between 5 and 15 characters long")
        } else {
            //prevents user from changing text fields/repressing button while account is created
            //also generates a spinner wheel to show user activity is taking place
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0,50,50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            //default error message, should not print
            var errorMessage = "Try again later"
            
            if signupActive == true {
                
                //creates PFUser object and sets fields
                let user = PFUser()
                user.email = fldEmail.text
                user.username = fldUsername.text
                user.password = fldPassword.text
                
                //attempts register with provided user information
                user.signUpInBackgroundWithBlock({ (success, error) -> Void in
                    self.activityIndicator.stopAnimating()
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
                    
                    //if no error
                    if error == nil{
                        
                        // registration success
                    
                    //if error exists
                    } else {
                        
                        //unwraps Parse error message as string
                        if let errorString = error!.userInfo["error"] as? String {
                            errorMessage = errorString
                        }
                        //displays Parse error message in alert
                        self.displayAlert("Registration Failed", message: errorMessage)
                        
                    }
                    
                    
                })
                
            } else {
                
                //attempts user login with provided user information
                PFUser.logInWithUsernameInBackground(fldUsername.text!, password: (fldPassword.text)!, block:
                    { (user, error) -> Void in
                        self.activityIndicator.stopAnimating()
                        UIApplication.sharedApplication().endIgnoringInteractionEvents()
                        
                        if user != nil{
                            
                            //User is now logged in, this will take us to main app screen
                            self.performSegueWithIdentifier("login", sender: self)
                            
                        } else {
                            //unwraps Parse error message as string
                            if let errorString = error!.userInfo["error"] as? String {
                                errorMessage = errorString
                            }
                            //displays Parse error message in alert
                            self.displayAlert("Sign In Failed", message: errorMessage)
                        }
                        
                })
            }
            
        }
        
    }
    
    @IBAction func btnSignIn(sender: AnyObject) {
        
        if signupActive == true{
            btnEnterInfo.setTitle("Sign In", forState: UIControlState.Normal)
            txtRegistered.text = "Not registered?"
            btnSwitchScreen.setTitle("Sign Up", forState: UIControlState.Normal)
            signupActive = false
        } else {
            btnEnterInfo.setTitle("Register", forState: UIControlState.Normal)
            txtRegistered.text = "Already registered?"
            btnSwitchScreen.setTitle("Sign In", forState: UIControlState.Normal)
            signupActive = true
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // hides keyboard on outside tap
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
}

