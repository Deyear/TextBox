//
//  TextBox.swift
//  Text
//
//  Created by 牛牛 on 16/2/26.
//  Copyright © 2016年 MZ. All rights reserved.
//


import UIKit
 
class TextBox: UITextField ,UITextFieldDelegate{
    
    var subV:UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        self.resignFirstResponder()
    }
    
    func click(){
        let subV = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width/3, height: self.frame.height))
        subV.text = self.placeholder
        subV.backgroundColor = UIColor.greenColor()
        subV.alpha = 0
        subV.tag = 1
        subV.textColor = UIColor.redColor()
        subV.textAlignment = NSTextAlignment.Center
        self.addSubview(subV)      
        UIView.animateWithDuration(1, delay: 0, options: .CurveLinear, animations: { () -> Void in
            subV.alpha = 0.5
            subV.frame.origin.x += self.frame.width - subV.frame.width
            }, completion: nil)
        
    }
    
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        self.click()
        return true
    }
    
    
    func textFieldDidEndEditing(textField: UITextField) {
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.subV?.frame.origin.x = 0
 
            for sub in self.subviews{
                if sub.tag == 1{
                    sub.removeFromSuperview()
                }
            }
        }, completion: nil)
        
    }
    
   
  
}