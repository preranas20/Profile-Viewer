//
//  SecondViewController.swift
//  InClass02
//
//  Created by Prerana Singh on 10/24/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//
/*Assignment: InClass02
 File: SecondViewController.swift
 Prerana Singh
 */

import UIKit

class SecondViewController: UIViewController {
   
    var name:String=""
    var user:User?
    var editname,editemail,editpassword,editDept:String?
    
    @IBOutlet var btnShowHide: UIButton!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var lblDepartment: UILabel!
    @IBOutlet var lblPassword: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = user?.name
        lblEmail.text = user?.email
      //  lblPassword.text = user?.password
        lblDepartment.text = user?.dept
        lblPassword.text = String(repeating: "*", count: (user?.password.count)!)
           // String(user?.password.character    { _ in return "*" })
     // lblInfo.text = user?.description
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditNameSegue"{
            let EditNameVC = segue.destination as! EditNameViewController
            editname = self.lblName.text!
            EditNameVC.name = editname
            
            
        }
        else if segue.identifier == "EditEmailSegue"{
            let EditEmailVC = segue.destination as! EditEmailViewController
            editemail = self.lblEmail.text!
            EditEmailVC.email = editemail
        }
        else if segue.identifier == "EditPasswordSegue"{
            let EditPasswordVC = segue.destination as! EditPasswordViewController
            editpassword = self.user?.password
            EditPasswordVC.password = editpassword
            
        }
        else if segue.identifier == "EditDeptSegue"{
            let EditDeptVC = segue.destination as! EditDepartmentViewController
            editDept = self.lblDepartment.text!
            EditDeptVC.department = editDept
        }
        
    }
    
    @IBAction func unwindToProfile(_ unwindSegue: UIStoryboardSegue) {
        if let senderVC = unwindSegue.source as? EditNameViewController{
            user?.name = senderVC.changedName!
            lblName.text = senderVC.changedName
        }
        else if let senderVC = unwindSegue.source as? EditEmailViewController{
            user?.email = senderVC.changedEmail!
            lblEmail.text = senderVC.changedEmail
        }
        else if let senderVc = unwindSegue.source as?
            EditPasswordViewController{
            user?.password = senderVc.changedpassword!
            lblPassword.text = String(repeating: "*", count: (senderVc.changedpassword!.count))
        }
        else if let senderVC = unwindSegue.source as? EditDepartmentViewController{
            user?.dept = senderVC.newDepartment!
            lblDepartment.text = senderVC.newDepartment
        }
        
    }
    
    
    @IBAction func btnShow(_ sender: Any) {
        //print(btnShowHide.currentTitle!)
        if btnShowHide.currentTitle == "Show"{
            lblPassword.text = user?.password
            btnShowHide.setTitle("Hide", for:.normal)
        }else{
            lblPassword.text = String(repeating: "*", count: (user?.password.count)!)
            btnShowHide.setTitle("Show", for: .normal)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
