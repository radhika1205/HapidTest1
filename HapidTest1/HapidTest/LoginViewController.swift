//
//  LoginViewController.swift
//  HapidTest
//
//  Created by Shubham Dubey on 27/02/23.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var eNterMobilelAbl: UILabel!
    @IBOutlet weak var hEllolAbl: UILabel!
    @IBOutlet weak var pHonenumber: UITextField!
    @IBOutlet weak var loginwIth: UILabel!
    @IBOutlet weak var cReatinglAbl: UILabel!
    
    @IBOutlet weak var gEtstartedbTTn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gEtstartedbTTn.layer.cornerRadius = 10
        
        
    }
    
    @IBAction func gEtStartedbTTn(_ sender: Any) {
        
        guard let mobileNumber = pHonenumber.text, mobileNumber.count == 10 else {
            
            let alert = UIAlertController(title: "Error", message: "Please enter a valid 10-digit mobile number", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let startIndex = mobileNumber.startIndex
        let firstTwoDigits = mobileNumber[startIndex..<mobileNumber.index(startIndex, offsetBy: 2)]
        let endIndex = mobileNumber.index(mobileNumber.endIndex, offsetBy: -2)
        let lastTwoDigits = mobileNumber[endIndex..<mobileNumber.endIndex]
        let otp = String(firstTwoDigits) + String(lastTwoDigits)
        
        let alert = UIAlertController(title: "OTP", message: "Your confirmation code is below — enter it  and we'll help you get signed in :    \(otp)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            
            self.performSegue(withIdentifier: "authenticateOTP", sender: self)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "authenticateOTP" {
            // Pass the entered mobile number and OTP to the OTP authentication screen
            if let OTPTableViewController = segue.destination as? OTPTableViewController {
                OTPTableViewController.mobileNumber = pHonenumber.text
                let startIndex = pHonenumber.text!.startIndex
                let firstTwoDigits = pHonenumber.text![startIndex..<pHonenumber.text!.index(startIndex, offsetBy: 2)]
                let endIndex = pHonenumber.text!.index(pHonenumber.text!.endIndex, offsetBy: -2)
                let lastTwoDigits = pHonenumber.text![endIndex..<pHonenumber.text!.endIndex]
                OTPTableViewController.expectedOTP = String(firstTwoDigits) + String(lastTwoDigits)
            }
        }
        
        
        
        
        
    }
}



