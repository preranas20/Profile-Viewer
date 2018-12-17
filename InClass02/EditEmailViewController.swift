//
//  EditEmailViewController.swift
//  InClass02
//
//  Created by Prerana Singh on 10/25/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//
/*Assignment: InClass02
File: EditEmailViewController.swift
Prerana Singh
*/
import UIKit

class EditEmailViewController: UIViewController {

    var email :String?
    var changedEmail:String?
    
    @IBOutlet var textEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        textEmail.text = email
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        changedEmail = textEmail.text
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "EditEmailSegueUnwind" {
            
            if (textEmail.text?.isEmpty)! {
                
                let alert = UIAlertController(title: "Error", message: "Fields cannot be empty", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
                
                return false
            }else if isValidEmail(email: textEmail.text)==false{
                let alert = UIAlertController(title: "Error", message: "Enter valid email", preferredStyle: .alert)
                
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
    
    
    
 func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }


}
