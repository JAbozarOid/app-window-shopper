//
//  Wage.swift
//  window-shopper
//
//  Created by ARATEL on 9/17/18.
//  Copyright © 2018 ARATEL. All rights reserved.
//

import Foundation

class Wage {
    // ---*** when we use class func it doesn't need to create a copy from this class we can access the method getHours any where by use "Wage.getHours" ***---
    // "forWage" and "andPrice"  are descriptions for variable wage and price
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        
        print("\(Int(round(price / wage)))")
        //return Int(round(price / wage)) // round method do like this 16.89 it converted to 16
        
        return Int(ceil(price / wage)) // cast double to int
        // method ceil means the result up to round number for example if the result is 16.89 it converted to 17
        
    }
}
