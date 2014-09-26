//
//  ViewController.swift
//  UnipagosIntegrationTest
//
//  Created by Leonardo Cid on 22/09/14.
//  Copyright (c) 2014 Unipagos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var recipientText : UITextField!
    @IBOutlet weak var amountText : UITextField!
    @IBOutlet weak var refIdText : UITextField!
    @IBOutlet weak var refText : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func payButtonTapped (sender: UIButton) {
        let uri = NSMutableString()
        let recipientString = recipientText.text;
        let amountString = amountText.text;
        let refIdString = refIdText.text;
        let refString = refText.text;
        uri.appendFormat("unipagos://pay?r=@(mdn:%@)&a=%@", recipientString, amountString);
        if (!refIdString.isEmpty) {
            uri.appendFormat("&i=%@", refIdString);
        }
        if (!refString.isEmpty) {
            uri.appendFormat("&t=%@", refString);
        }
        uri.appendString("&url=unipagosint://");
        NSLog("%@", uri);
        let URL = NSURL(string: uri);
        NSLog("%@", URL);
        UIApplication.sharedApplication().openURL(URL);
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField.tag == 4) {
            textField.resignFirstResponder();
        } else {
            var txtField : UITextField? = self.view.viewWithTag(textField.tag + 1) as? UITextField;
            txtField?.becomeFirstResponder();
        }
        textField.resignFirstResponder();
        return false;
    }
}

