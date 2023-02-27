//
//  CreateProfileTableViewController.swift
//  HapidTest
//
//  Created by Shubham Dubey on 27/02/23.
//

import UIKit

class CreateProfileTableViewController: UITableViewController {
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var firStnAmelAbl: UILabel!
    
    @IBOutlet weak var firStnAmetxt: UITextField!
    @IBOutlet weak var lAstnAmelAbl: UILabel!
    @IBOutlet weak var lAstnAmetxt: UITextField!
    @IBOutlet weak var phoneNumberlAbl: UILabel!
    @IBOutlet weak var phoneNumbertxt: UITextField!
    @IBOutlet weak var SubmitbTTn: UIButton!
    @IBOutlet weak var pIckyourloCationbTTn: UIButton!
    @IBOutlet weak var postalcodeLAb: UILabel!
    @IBOutlet weak var sElecttxt: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        SubmitbTTn.layer.cornerRadius = 10
       
    }

    @IBAction func pIckyourloCationbTTn(_ sender: Any) {
        
    }
    
    @IBAction func signUpbTTn(_ sender: Any) {
        let firstName = firStnAmetxt.text ?? ""
             let lastName = lAstnAmetxt.text ?? ""
        let phone = phoneNumbertxt.text ?? ""
        let post = sElecttxt.text ?? ""
      
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

               
                var request = URLRequest(url: url)
                request.httpMethod = "POST"

               
                let bodyData = "firstName=\(firstName)&lastName=\(lastName)&phone=\(phone)&post=\(post)"
                request.httpBody = bodyData.data(using: .utf8)

                
                let session = URLSession.shared
                let task = session.dataTask(with: request) { (data, response, error) in
                   
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                    } else if let response = response as? HTTPURLResponse {
                        print("Response code: \(response.statusCode)")
                    }
                }

              
                task.resume()
            }
        }
        
