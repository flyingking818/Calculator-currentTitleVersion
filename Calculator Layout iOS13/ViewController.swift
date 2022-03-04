//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.

//  Enhanced by Jeremy on 3/3/2022
//  sender.currentTitle version! :)

import UIKit

class ViewController: UIViewController {
    
    
    //Explicit variable declaration
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    //These are flags for state control
    var performingMath = false
    var newCalculation = false
    var operation = ""
    var reverseVal: Double = 0
      
    @IBOutlet weak var screenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Numbers(_ sender: UIButton) {
        //check whether an operator is pressed
        if performingMath == true {
            screenLabel.text = sender.currentTitle
            numberOnScreen = Double(screenLabel.text!)!
            performingMath = false
        } else {
            //reset screen to empty
            if screenLabel.text == "0" || newCalculation == true {
                screenLabel.text = ""
            }
            
            screenLabel.text = screenLabel.text! + sender.currentTitle! //create the on screen input text
       
            numberOnScreen = Double(screenLabel.text!)!
            newCalculation = false
        }
    
        
    }
    
    
    @IBAction func Operators(_ sender: UIButton) {
        //This can be done at the design level.
        if (screenLabel.text != "" && sender.currentTitle != "%" && sender.currentTitle != "+/-" && sender.currentTitle != "AC" && sender.currentTitle != "=" ){ //operators
            
            previousNumber = Double(screenLabel.text!)!
            
            screenLabel.text = sender.currentTitle!
            
            operation = sender.currentTitle!
            performingMath = true;
            
       } else if sender.currentTitle == "=" { //equal = button
           
           
           /*
            if operation == "÷"{ //Divide
                screenLabel.text = String(previousNumber / numberOnScreen)
            }
            else if operation == "×"{ //Multiply
                screenLabel.text = String(previousNumber * numberOnScreen)
            }
            else if operation == "-"{ //Subtract
                screenLabel.text = String(previousNumber - numberOnScreen)
            }
            else if operation == "+"{ //Add
                screenLabel.text = String(previousNumber + numberOnScreen)
            }
            */
           //You can also use switch case here
           
           switch operation {
                case "÷":
                    screenLabel.text = String(previousNumber / numberOnScreen)
                case "×":
                    screenLabel.text = String(previousNumber * numberOnScreen)
                case "-":
                    screenLabel.text = String(previousNumber - numberOnScreen)
                case "+":
                    screenLabel.text = String(previousNumber + numberOnScreen)
                default:
                   screenLabel.text = "Error! Check the entry!"
           }
           
            performingMath = false
            newCalculation = true
        }
        else if sender.currentTitle == "AC"{ //AC button
            screenLabel.text = "0"
            previousNumber = 0
            numberOnScreen = 0
            operation = ""
        }
        
    }
    
    
}

