//
//  ViewController.swift
//  UnipagosIntegrationTest
//
//  Created by Leonardo Cid on 22/09/14.
//  Copyright (c) 2014 Unipagos. All rights reserved.
//

import UIKit

let kPaymentURLiteralAmount = "a";
let kPaymentURLiteralRecipientID = "r";
let kPaymentURLiteralReferenceID = "i";
let kPaymentURLiteralCallbackURL = "url";
let kPaymentURLiteralReferenceText = "t";
let kPaymentURLiteralNeedsUserValidation = "v";
let kPaymentURLiteralURLScheme = "unipagos://pay";

//you will use one of these two
let kPaymentURLiteralMerchant = "merchant";
let kPaymentURLiteralMDN = "mdn";


class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var recipientText : UITextField!
    @IBOutlet weak var amountText : UITextField!
    @IBOutlet weak var refIdText : UITextField!
    @IBOutlet weak var refText : UITextField!
    @IBOutlet weak var validationSwitch : UISwitch!

    
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
        let recipientString = recipientText.text
        let amountString = amountText.text
        let refIdString = refIdText.text
        let refString = refText.text
        
        uri.appendFormat("%@?%@=@(%@:%@)&%@=%@",kPaymentURLiteralURLScheme,
                         kPaymentURLiteralRecipientID,
                         kPaymentURLiteralMerchant,
                         recipientString!,
                         kPaymentURLiteralAmount,
                         amountString!)
        
        if (!(refIdString?.isEmpty)!) {
            uri.appendFormat("&%@=%@",kPaymentURLiteralReferenceID, refIdString!)
        }
        
        if (refString?.isEmpty)! {
            uri.appendFormat("&%@=%@",kPaymentURLiteralReferenceText, refString!)
        }
        
        if(validationSwitch.isOn){
            uri.appendFormat("&%@=true", kPaymentURLiteralNeedsUserValidation)
        }
        
        
        uri.append("&url=unipagosint://") //callback URL
        print(uri)
        if let anURL = URL(string: uri as String) {
            print(anURL);
            UIApplication.shared.openURL(anURL)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 4 {
            textField.resignFirstResponder()
        } else {
            let txtField : UITextField? = self.view.viewWithTag(textField.tag + 1) as? UITextField
            txtField?.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return false;
    }
}

