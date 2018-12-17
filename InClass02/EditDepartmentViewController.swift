//
//  EditDepartmentViewController.swift
//  InClass02
//
//  Created by Prerana Singh on 10/25/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//

/*Assignment: InClass02
 File: EditDepartmentViewController.swift
 Prerana Singh
 */

import UIKit

class EditDepartmentViewController: UIViewController {

    @IBOutlet var departmentSegment: UISegmentedControl!
    var department, changedDept,newDepartment: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch department{
        case "CS":
            departmentSegment.selectedSegmentIndex = 0
        case "SIS":
            departmentSegment.selectedSegmentIndex = 1
        case "BIO":
            departmentSegment.selectedSegmentIndex = 2
        default:
            print("No department selected")
        }

        // Do any additional setup after loading the view.
    }
    

    @IBAction func segmentedSelection(_ sender: UISegmentedControl) {
        switch departmentSegment.selectedSegmentIndex {
        case 1:
            changedDept = departmentSegment.titleForSegment(at: 1) ?? ""
           // print(changedDept!)
        case 2:
            changedDept = departmentSegment.titleForSegment(at: 2) ?? ""
           // print(changedDept!)
        default:
            changedDept = departmentSegment.titleForSegment(at: 0) ?? ""
            //print(changedDept!)
        
     }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        newDepartment = changedDept
    }
}
