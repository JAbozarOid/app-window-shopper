//
//  ViewController.swift
//  window-shopper
//
//  Created by ARATEL on 9/17/18.
//  Copyright © 2018 ARATEL. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var wageTxt: CurrencyTxtField!
    @IBOutlet weak var priceTxt: CurrencyTxtField!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var hoursLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // *** we want to create a button in code(programatically) and not in uiInterface
        // we want to create uiButton in code we sould use button with frame
        let calcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calcBtn.backgroundColor = #colorLiteral(red: 0.9420209391, green: 0.5464910616, blue: 0.01212033892, alpha: 1)
        calcBtn.setTitle("Calculate", for: .normal)
        calcBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        // we click or tap on calc button what happend? - > use addTarget method
        calcBtn.addTarget(self, action: #selector(MainVC.calculate), for: .touchUpInside)
        
        // code for textfields
        wageTxt.inputAccessoryView = calcBtn
        priceTxt.inputAccessoryView = calcBtn
        
        // at the first load these two labels are hidden
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
    }

    
    @objc func calculate(){
        //print("we got here")
        
        // check if the text fields is not nil
        if let wageTxt = wageTxt.text , let priceTxt = priceTxt.text {
            // the second if for casting string to double
            if let wage = Double(wageTxt) , let price = Double(priceTxt){
                // for to force close of keyboard
                view.endEditing(true)
                resultLbl.isHidden = false
                hoursLbl.isHidden = false
                resultLbl.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
            }
        }
        
    }
    

    @IBAction func clearCalcPressed(_ sender: Any) {
        // when this btn pressed we want to clear the text fiels and hide the two labels
        hoursLbl.isHidden = true
        resultLbl.isHidden = true
        wageTxt.text = ""
        priceTxt.text = ""
    }
    
}

