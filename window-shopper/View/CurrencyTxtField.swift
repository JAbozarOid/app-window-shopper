//
//  CurrencyTxtField.swift
//  window-shopper
//
//  Created by ARATEL on 9/17/18.
//  Copyright © 2018 ARATEL. All rights reserved.
//

import UIKit

// ** when we want to see the change of code here in interface in real time we should use this class first add this class "@IBDesignable" and second override the method prepareForInterfaceBuilder()
@IBDesignable

class CurrencyTxtField: UITextField {
    
    
    // --** never ever do not this method with empty body
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 20
        let currencyLabel = UILabel(frame: CGRect(x: 5, y: (frame.size.height/2)-size/2, width: size, height: size))
        currencyLabel.backgroundColor = #colorLiteral(red: 0.4472288861, green: 0.501960814, blue: 0.4908446542, alpha: 0.7981057363)
        currencyLabel.textAlignment = .center
        currencyLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        currencyLabel.layer.cornerRadius = 5.0
        currencyLabel.clipsToBounds = true 
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        
        currencyLabel.text = formatter.currencySymbol
        
        addSubview(currencyLabel)
    }
    
    // ** for sync this code with interface builder to see changes - > "this method rub in interface builder"
    override func prepareForInterfaceBuilder() {
        
        customizedView()
    }

    // when the app interface is loaded - > this method is run at runtime
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customizedView()
      
    }
    
    // ---*** for handle two method that one of them is run in interface builder and the other one run at runtime we do like this
    func customizedView(){
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.25)
        layer.cornerRadius = 5.0
        textAlignment = .center
        
        clipsToBounds = true
        
        // 1- way 1 this is the safty way to checkout a data of variable if force to unwrap optional !
        //        if placeholder == nil {
        //            placeholder = " "
        //        }
        
        // 2- way 2 for check if the value is not null or nil
        if let p = placeholder {
            let place = NSAttributedString (string: p, attributes: [.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
            attributedPlaceholder = place
            textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }

}
