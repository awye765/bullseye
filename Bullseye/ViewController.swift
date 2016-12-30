//
//  ViewController.swift
//  Bullseye
//
//  Created by Alistair Wye on 29/12/2016.
//  Copyright © 2016 wyedawg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
    
    @IBAction func showAlert() {
        var difference: Int
        if currentValue > targetValue {
            difference = currentValue - targetValue
        } else if currentValue < targetValue {
            difference = targetValue - currentValue
        } else {
            difference = 0
        }
            
        let message = "The value of the slider is: \(currentValue)" +
                      "\nThe target value is: \(targetValue)" +
                      "\nThe difference is: \(difference)"
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
        updateLabels()  
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        // lroundf rounds the float value of the slider to an integer
    }
}

