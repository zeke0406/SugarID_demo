//
//  ViewController.swift
//  SugarID_demo
//
//  Created by Aries Rong on 10/25/20.
//  Copyright © 2020 Zeke Rong. All rights reserved.
//

import UIKit




class ViewController: UIViewController {


    @IBOutlet weak var textInput: UITextField!
    
    @IBOutlet weak var output: UILabel!
    
    var bloodSugar = 0.0
    var insulin = 0.0
    var food = 0.0
    var carbRatio = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


    @IBAction func bloodSugar(_ sender: UIButton, forEvent event: UIEvent) {
        bloodSugar = Double(textInput!.text!) ?? 0
        print("bloodSugar\(bloodSugar)")
        
        //check if all required data has been filled in
        if bloodSugar <= 0{
            output.text = String("Entered wrong blood sugar value, please try again :)")
        }
        
    }
    
    @IBAction func insulin(_ sender: UIButton, forEvent event: UIEvent) {
        insulin = Double(textInput!.text!) ?? 0
        print("insulin\(insulin)")
        
        //check if all required data has been filled in
        if bloodSugar == 0 || insulin == 0 || food == 0 || carbRatio == 0{
            output.text = String("need more data :)")
        }
    }
    
    @IBAction func food(_ sender: UIButton, forEvent event: UIEvent) {
        food = Double(textInput!.text!) ?? 0
        print("food\(food)")
    }
    
    @IBAction func carbRatio(_ sender: Any) {
        carbRatio = Double(textInput!.text!) ?? 0
        print("carbRatio\(carbRatio)")
        if carbRatio <= 0{
            output.text = String("Wrong Carb Ratio Entered, please entered it again :)")
        }
        else if carbRatio > 0{
            output.text = String("Carb Ratio Entered! :)")
        }
    }
    
    
    
    
    
    

}

