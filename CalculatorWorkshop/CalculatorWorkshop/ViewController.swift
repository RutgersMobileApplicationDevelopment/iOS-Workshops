//
//  ViewController.swift
//  CalculatorWorkshop
//
//  Created by Sujit Molleti on 9/22/20.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operators{
        case none, plus, minus, times, divides
    }
    
    enum States {
        case clear, digit1, float, op, equals, digit2
    }

    @IBOutlet weak var numberLabel: UILabel!
    
    var numString: String?
    var firstNum: String?
    
    var op: Operators = .none
    var state: States = .clear
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if state == .clear {
            state = .digit1
        }
        
        if numString == nil{
            numString = "\(sender.tag)"
        } else {
            numString = numString! + "\(sender.tag)" // String interpolation
        }
        
        numberLabel.text = numString
            
        
    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        
        //saving the first number, and reseting the result label
        isFirstNumNil()
        
        //what operator has been pressed
        op = .plus
        
        //what state we are going into
        state = .op
        
    }
    
    @IBAction func minusButtonPressed(_ sender: Any) {
        
        isFirstNumNil()
        op = .minus
        state = .op
    }
    
    @IBAction func timesButtonPressed(_ sender: Any) {
        isFirstNumNil()
        op = .times
        state = .op
    }
    
    @IBAction func dividesButtonPressed(_ sender: Any) {
        isFirstNumNil()
        op = .divides
        state = .op
    }
    
    func isFirstNumNil(){
        if( firstNum == nil){
            firstNum = numString
        }
        numString = nil
    }
    
    @IBAction func equalButtonPressed(_ sender: Any) {
        
        //Checking if we have two numbers as Strings that we can compute
        guard let num1String: String = firstNum else { return }
        guard let num2String: String = numString else { return }
        
        //casting to doubles
        guard let num1 = Double(num1String) else { return }
        guard let num2 = Double(num2String) else { return }
        
        var total: Double
        
        switch op {
            case .plus:
                total = num1 + num2
            case .minus:
                total = num1-num2
            case .times:
                total = num1*num2
            default:
                total = num1/num2
        }
        
        firstNum = truncateTotal(num: total)
        
        numberLabel.text = firstNum
        numString = nil
        state = .equals
        
    }
    
    func truncateTotal(num: Double) -> String {
        if let s = Int(exactly: num){ //101.0 --> 101
            return "\(s)"
        }
        
        return "\(num)" //101.56
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        
        numString = nil
        firstNum = nil
        numberLabel.text = "0"
        state = .clear
        
    }
}

