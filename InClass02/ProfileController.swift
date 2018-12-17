//
//  ProfileController.swift
//  InClass02
//
//  Created by Prerana Singh on 10/24/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {

    @IBOutlet var labelInfo: UILabel!
    var user:User?
    override func viewDidLoad() {
        super.viewDidLoad()
        labelInfo.text = user?.description

        // Do any additional setup after loading the view.
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
