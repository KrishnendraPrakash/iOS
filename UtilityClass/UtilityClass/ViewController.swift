//
//  ViewController.swift
//  UtilityClass
//
//  Created by krishnendra on 04/09/17.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldLogin: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginAction(_ sender: Any) {
        if Utils.validationUITextFields(view: self.view){
            print("CALL LOGIN API")
        }else{
            alertWithTitleAndMessage(("Alert", "Invalid/Empty Text field"))
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

