//
//  OTPTableViewController.swift
//  HapidTest
//
//  Created by Shubham Dubey on 26/02/23.
//

import UIKit

class OTPTableViewController: UITableViewController,UITextFieldDelegate {
    
    @IBOutlet weak var sTackview: UIStackView!
    @IBOutlet weak var eNterverificationlAbl: UILabel!
    @IBOutlet weak var sEntlAbl: UILabel!
    @IBOutlet weak var OTp1txtfield: UITextField!
    @IBOutlet weak var OTp2txtfield: UITextField!
    @IBOutlet weak var OTp3txtfield: UITextField!
    @IBOutlet weak var OTp4txtfield: UITextField!
    
    var mobileNumber: String?
    var expectedOTP: String?
    
    @IBOutlet weak var sUbmitBttn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        sUbmitBttn.layer.cornerRadius = 10
        OTp1txtfield.delegate = self
        OTp2txtfield.delegate = self
        OTp3txtfield.delegate = self
        OTp4txtfield.delegate = self
        
        self.OTp1txtfield.addTarget(self, action:#selector(self.changecharacters),for:.editingChanged)
        self.OTp2txtfield.addTarget(self, action:#selector(self.changecharacters),for:.editingChanged)
        self.OTp3txtfield.addTarget(self, action:#selector(self.changecharacters),for:.editingChanged)
        self.OTp4txtfield.addTarget(self, action:#selector(self.changecharacters),for:.editingChanged)
        
        
    }
    
    
    @objc func changecharacters(textfield:UITextField)
    {
        if textfield.text?.utf8.count == 1 {
            switch textfield {
            case OTp1txtfield:
                OTp2txtfield.becomeFirstResponder()
            case OTp2txtfield:
                OTp3txtfield.becomeFirstResponder()
            case OTp3txtfield:
                OTp4txtfield.becomeFirstResponder()
            case OTp4txtfield:
                print("OTP = \(OTp1txtfield.text!)\(OTp2txtfield.text!)\(OTp3txtfield.text!)\(OTp4txtfield.text!)")
            default:
                break
            }
        }
        
        else {
            if textfield.text!.isEmpty {
                switch textfield {
                case OTp4txtfield:
                    OTp3txtfield.becomeFirstResponder()
                case OTp3txtfield:
                    OTp2txtfield.becomeFirstResponder()
                case OTp2txtfield:
                    OTp1txtfield.becomeFirstResponder()
                default:
                    break
                }
            }
            
        }
        
    }
    
    
    @IBAction func sUbmitbTTn(_ sender: Any) {
        let enteredOTP = OTp1txtfield.text! + OTp2txtfield.text! + OTp3txtfield.text! + OTp4txtfield.text!
        if enteredOTP == expectedOTP {
            let secondViewController = (self.storyboard?.instantiateViewController(withIdentifier: "CreateProfileTableViewController") as? CreateProfileTableViewController)!
            self.navigationController?.pushViewController(secondViewController, animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "The entered OTP is incorrect. Please try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
        
    }
}
