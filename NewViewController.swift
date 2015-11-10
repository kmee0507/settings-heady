//
//  NewViewController.swift
//  Settings
//
//  Created by kc mee on 11/2/15.
//  Copyright © 2015 kc mee. All rights reserved.
//

import UIKit

class NewViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate, UITextFieldDelegate {

    
    
    @IBOutlet weak var logoutLabel: UILabel!
    @IBOutlet weak var submitChangesButton: UIButton!
    @IBOutlet weak var reenterNewUsernameTextField: UITextField!
    @IBOutlet weak var newUsernameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var myPicker: UIPickerView!
    var pickerData = ["Dark Gray","Light Gray","White","Red","Green","Blue","Cyan","Yellow","Magenta","Orange","Purple", "Brown"]
    var titleString: String!
    let prefs = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color = prefs.stringForKey("Color")
        if (color == "darkGray"){
            self.view.backgroundColor = UIColor.darkGrayColor()
        }
        else if (color == "lightGray"){
            self.view.backgroundColor = UIColor.lightGrayColor()
        }
        else if (color == "white"){
            self.view.backgroundColor = UIColor.whiteColor()
        }
        else if (color == "red"){
            self.view.backgroundColor = UIColor.redColor()
        }
        else if (color == "green"){
            self.view.backgroundColor = UIColor.greenColor()
        }
        else if (color == "blue"){
            self.view.backgroundColor = UIColor.blueColor()
        }
        else if (color == "cyan"){
            self.view.backgroundColor = UIColor.cyanColor()
        }
        else if (color == "yellow"){
            self.view.backgroundColor = UIColor.yellowColor()
        }
        else if (color == "magenta"){
            self.view.backgroundColor = UIColor.magentaColor()
        }
        else if (color == "orange"){
            self.view.backgroundColor = UIColor.orangeColor()
        }
        else if (color == "purple"){
            self.view.backgroundColor = UIColor.purpleColor()
        }
        else if (color == "brown"){
            self.view.backgroundColor = UIColor.brownColor()
        }
        self.titleLabel.text = self.titleString
        if (self.titleLabel.text == "Color Scheme"){
            
            myPicker.dataSource = self
            myPicker.delegate = self
            usernameTextField.hidden = true
            newUsernameTextField.hidden = true
            reenterNewUsernameTextField.hidden = true
            submitChangesButton.hidden = true
            logoutLabel.hidden = true
        }
        else if(self.titleLabel.text == "Beer To Locate"){
            pickerData.removeAll()
            pickerData = ["Heady Topper", "Sip Of Sunshine"]
            myPicker.dataSource = self
            myPicker.delegate = self
            usernameTextField.hidden = true
            newUsernameTextField.hidden = true
            reenterNewUsernameTextField.hidden = true
            submitChangesButton.hidden = true
            logoutLabel.hidden = true
        }
        else if(self.titleLabel.text == "Change Username"){
            myPicker.hidden = true
            logoutLabel.hidden = true
        }
        else if(self.titleLabel.text == "Logout"){
            usernameTextField.hidden = true
            myPicker.hidden = true
            newUsernameTextField.hidden = true
            reenterNewUsernameTextField.hidden = true
            submitChangesButton.hidden = true
            titleLabel.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        let selectedValue = pickerData[pickerView.selectedRowInComponent(0)]
        if(row == 0 && selectedValue == "Dark Gray")
        {
            self.view.backgroundColor = UIColor.darkGrayColor();
            defaults.setValue("darkGray", forKey: "Color")
        }
        else if(row == 1 && selectedValue == "Light Gray")
        {
            self.view.backgroundColor = UIColor.lightGrayColor();
            defaults.setValue("lightGray", forKey: "Color")
        }
        else if(row == 2 && selectedValue == "White")
        {
            self.view.backgroundColor = UIColor.whiteColor();
            defaults.setValue("white", forKey: "Color")
        }
        else if(row == 3 && selectedValue == "Red")
        {
            self.view.backgroundColor = UIColor.redColor();
            defaults.setValue("red", forKey: "Color")
        }
        else if(row == 4 && selectedValue == "Green")
        {
            self.view.backgroundColor = UIColor.greenColor();
            defaults.setValue("green", forKey: "Color")
        }
        else if(row == 5 && selectedValue == "Blue")
        {
            self.view.backgroundColor = UIColor.blueColor();
            defaults.setValue("blue", forKey: "Color")
        }
        else if(row == 6 && selectedValue == "Cyan")
        {
            self.view.backgroundColor = UIColor.cyanColor();
            defaults.setValue("cyan", forKey: "Color")
        }
        else if(row == 7 && selectedValue == "Yellow")
        {
            self.view.backgroundColor = UIColor.yellowColor();
            defaults.setValue("yellow", forKey: "Color")
        }
        else if(row == 8 && selectedValue == "Magenta")
        {
            self.view.backgroundColor = UIColor.magentaColor();
            defaults.setValue("magenta", forKey: "Color")
        }
        else if(row == 9 && selectedValue == "Orange")
        {
            self.view.backgroundColor = UIColor.orangeColor();
            defaults.setValue("orange", forKey: "Color")
        }
        else if(row == 10 && selectedValue == "Purple")
        {
            self.view.backgroundColor = UIColor.purpleColor();
            defaults.setValue("purple", forKey: "Color")
        }
        else if(row == 11 && selectedValue == "Brown")
        {
            self.view.backgroundColor = UIColor.brownColor();
            defaults.setValue("brown", forKey: "Color")
        }
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
