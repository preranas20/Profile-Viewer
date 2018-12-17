//
//  EditPasswordViewController.swift
//  InClass02
//
//  Created by Prerana Singh on 10/25/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//
/*Assignment: InClass02
 File: EditPasswordViewController.swift
 Prerana Singh
 */

import UIKit

class EditPasswordViewController: UIViewController {
    @IBOutlet var editPass: UITextField!
    var password,changedpassword:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       editPass.text = password
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        changedpassword = editPass.text
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "EditPassSegueUnwind"{
            
            if (editPass.text?.isEmpty)! {
                
                let alert = UIAlertController(title: "Error", message: "Fields cannot be empty", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
                
                return false
            }
            else {
                return true
            }
            
        }
        return true

    }


}
