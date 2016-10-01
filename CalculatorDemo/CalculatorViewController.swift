//
//  ViewController.swift
//  CalculatorDemo
//
//  Created by Georgij on 19.09.16.
//  Copyright © 2016 Georgii Emeljanow. All rights reserved.
//

import UIKit

enum OperationType {
    case Constant(value: Double)
    case UnaryOperation(value: Double)
    case BinaryOparetion(firstValue: Double, secondValue: Double)
    case Equals
}

// проверка версии телефона
//if #available(iOS 9, *) {
//    
//}

class CalculatorViewController: UIViewController {
    
    // MARK: Variables
    var expression: String? = "0"
    var operatorsArray = [Int]()
    var isNewOperator = true
    
    // MARK: IBOutlets
    @IBOutlet weak var expressionLbl: UILabel!
    
    // MARK: Functions
    func setDefaultState() {
        expressionLbl.text = expression
    }
    
    func performOperation() {
        if operatorsArray.count > 1 {
            expression = String(operatorsArray[0] + operatorsArray[1])
            operatorsArray[0] = (Int(expression!))!
            operatorsArray.removeAtIndex(1)
            setDefaultState()
        }
    }
    
    // MARK: IBActions
    @IBAction func numberWasTapped(sender: UIButton) {
        if isNewOperator {
            isNewOperator = false
            expression = ""
        }
        expression = expression?.stringByAppendingString((sender.titleLabel?.text)!)
        self.setDefaultState()
    }
    
    @IBAction func getResult(sender: UIButton) {
        if sender.titleLabel?.text == "+" {
            operatorsArray.append(Int(expression!)!)
            self.performOperation()
            isNewOperator = true
        }
    }
}

extension CalculatorViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDefaultState()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
}
