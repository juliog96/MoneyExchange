//
//  money.swift
//  MoneyChanged
//
//  Created by Julio on 31/10/18.
//  Copyright © 2018 JulioG. All rights reserved.
//
import Foundation
import UIKit

public class money {
    
    var name: String = ""
    var backimage: UIImage = UIImage()
    var flag: UIImage = UIImage()
    var value: Double = 0
    
    init(){
    }
    
    init(name: String, backimage: String, flag: String, value: Double){
        self.name = name
        self.backimage = UIImage(named: backimage)!
        self.flag = UIImage(named: flag)!
        self.value = value
    }
}
