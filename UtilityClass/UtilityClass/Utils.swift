//
//  Utils.swift
//  UtilityClass
//  Created by krishnendra on 29/08/17.
//

import Foundation
import UIKit

public class Utils {
    
    private init(){
        
    }
    
    class func validationUITextFields(view:UIView) -> Bool{
        for view in view.subviews {
            if let textField = view as? UITextField {
                if let text = textField.text, text.isEmpty {
                    // show error
                    return false
                }
            }
        }
        return true
    }
}

extension UIViewController{
    public func alertWithTitleAndMessage(_ titleMessage:(String, String)) {
        let alert = UIAlertController(title: titleMessage.0, message: titleMessage.1, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK" , style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: false, completion: nil)
    }
}

