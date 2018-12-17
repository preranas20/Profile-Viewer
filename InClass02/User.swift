//
//  User.swift
//  InClass02
//
//  Created by Prerana Singh on 10/24/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//

/*Assignment: InClass02
 File: User.swift
 Prerana Singh
 */

import Foundation
class User{
    var name:String=""
    var email:String=""
    var password:String=""
    var dept:String=""
    
    
    init(name:String,email:String,password:String,dept:String){
        self.name=name
        self.email=email
        self.password=password
        self.dept=dept
    }
    
    init(){}
    
    var description:String{
        return "\(name),\(dept),\(email),\(password)"
    }
}
