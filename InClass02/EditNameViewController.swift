//
//  EditNameViewController.swift
//  InClass02
//
//  Created by Prerana Singh on 10/24/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//
/*Assignment: InClass02
 File: EditNameViewController.swift
 Prerana Singh
 */
import UIKit

class EditNameViewController: UIViewController {

    var name :String?
    var changedName:String?
    @IBOutlet var editTextName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editTextName.text = name

        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       changedName = editTextName.text
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    
            if identifier == "editNameSegueUnwind" {
               
                if (editTextName.text?.isEmpty)! {
                    
                    let alert = UIAlertController(title: "Error", message: "Fields cannot be empty", preferredStyle: .alert)
                    
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
