//
//  ViewController.swift
//  InClass02
//
//  Created by Prerana Singh on 10/24/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//

/*Assignment: InClass02
 File: ViewController.swift
 Prerana Singh
 */

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var textName: UITextField!
    @IBOutlet var textEmail: UITextField!
    @IBOutlet var textPassword: UITextField!
    @IBOutlet var segmentedDept: UISegmentedControl!
    var user:User?
    var txtname = ""
    var txtemail = ""
    var txtpassword = ""
    var txtdept = ""
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        segmentedDept.selectedSegmentIndex = 0
   
  
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProfileVCSegue"{
            let ProfileVC = segue.destination as! SecondViewController
            txtname = self.textName.text!
            txtemail = self.textEmail.text!
            txtpassword = self.textPassword.text!
            if txtdept == ""{
              txtdept = "CS"
            }
            user = User(name: txtname, email: txtemail, password: txtpassword, dept: txtdept)
            ProfileVC.user = user
            
        
        }
    }


        
   @IBAction func segmentedSelection(_ sender: UISegmentedControl) {
    
            switch segmentedDept.selectedSegmentIndex {
        case 1:
            txtdept = segmentedDept.titleForSegment(at: 1) ?? ""
          //  print(txtdept)
        case 2:
            txtdept = segmentedDept.titleForSegment(at: 2) ?? ""
          //  print(txtdept)
        default:
            txtdept = segmentedDept.titleForSegment(at: 0) ?? ""
          //  print(txtdept)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "ProfileVCSegue" {
            
            if ((textName.text?.isEmpty)! || (textEmail.text?.isEmpty)! || (textPassword.text?.isEmpty)!) {
                
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
        
        // by default, transition
        return true
    }
    
    
    func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textName.text = ""
        textEmail.text = ""
        textPassword.text = ""
        segmentedDept.selectedSegmentIndex = 0
    }

}

