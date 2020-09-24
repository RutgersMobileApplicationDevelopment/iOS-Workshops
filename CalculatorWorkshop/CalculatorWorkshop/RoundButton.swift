//
//  RoundButton.swift
//  CalculatorWorkshop
//
//  Created by Sujit Molleti on 9/22/20.
//

import UIKit
//public class RoundButton extends UIButton
class RoundButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 40
        self.layer.masksToBounds = true 
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
