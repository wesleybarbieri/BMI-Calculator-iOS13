//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    @IBOutlet weak var weitghtLabel: UILabel!
    @IBOutlet weak var heightLabel:
        UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weitghtSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func heigthSliderChanged(_ sender: UISlider) {
        let height  =  String(format: "%.2f", sender.value)
        heightLabel.text  = "\(height)m"
    }
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight =  String(format: "%.0f", sender.value)
        weitghtLabel.text = "\(weight)Kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weitghtSlider.value
       
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "goToResult"  {
            let destinationVC = segue.destination as! ResultsViewController
        destinationVC.bmiValue = calculatorBrain.getBMIValue()
        destinationVC.advice = calculatorBrain.getAdvice()
        destinationVC.color = calculatorBrain.getColor()
        }
    }

}

