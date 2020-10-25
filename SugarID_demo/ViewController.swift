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
    
    var bloodSugar_value = 0.0
    var insulin_value = 0.0
    var food_value = 0.0
    var carbRatio_value = 0.0
    var inputFood : String=""
    var thisfood : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func getArray(name: String)->(Array<Dictionary<String,String>>){
        let path = Bundle.main.path(forResource: name, ofType: "plist")
        var arr :NSArray?
        arr = NSArray(contentsOfFile:path!)
        return (arr as? Array<Dictionary<String,String>>)!
    }


    @IBAction func bloodSugar(_ sender: UIButton, forEvent event: UIEvent) {
        bloodSugar_value = Double(textInput!.text!) ?? 0
        print("bloodSugar\(bloodSugar_value)")
        
        //check if all required data has been filled in
        if bloodSugar_value <= 0{
            output.text = String("Entered wrong blood sugar value, please try again :)")
        }
        else if food_value == 0{
            if bloodSugar_value < 80{
                output.text = String("Suggestion: lowering insulin injection by 2 :)")
            }
            else if bloodSugar_value > 130{
                output.text = String("Suggestion: increasing insulin injection by 2 :)")
            }
            else{
                output.text = String("Blood sugar entered, everything is good now! :)")
            }
        }
        else if food_value > 0{
            if bloodSugar_value < 90{
                output.text = String("Suggestion: lowering insulin injection by 2 :)")
            }
            else if bloodSugar_value > 180{
                output.text = String("Suggestion: increasing insulin injection by 2 :)")
            }
            else{
                output.text = String("Blood sugar entered, everything is good now! :)")
            }
        }
    }
    
    @IBAction func insulin(_ sender: UIButton, forEvent event: UIEvent) {
        insulin_value = Double(textInput!.text!) ?? 0
        print("insulin\(insulin_value)")
        
        //check if all required data has been filled in
        if insulin_value < 0 {
            output.text = String("Wrong insulin value, please enter again :)")
        }
        else {
            let car_intake_sugg = insulin_value * carbRatio_value
            output.text = String("Insulin value Entered, suggests carbon intake is \(car_intake_sugg) g.")
        }
    }
    
    @IBAction func food(_ sender: UIButton, forEvent event: UIEvent) {
        inputFood = (textInput!.text!)
        print("food\(inputFood)")
        var arr: [String] = inputFood.components(separatedBy: " ")
        if arr.count != 2 {
            output.text = String("wrong format, default as \"foodname weight(100g)\", eg.:\"apple 0.2\" ")
            return
        }
        thisfood = Double(arr[1]) ?? 0.0
        if thisfood == 0{
            output.text = String("Please enter valid weight for food, with unit 100g ")
            return
        }
        var foodname: String = arr[0]
        foodname = foodname.lowercased()
        var standard: String = ""
        var dataarr = getArray(name: "sampledata")
        for group in dataarr{
            var arrname = (String(group["item0"] ?? ""))
            arrname=arrname.lowercased()
            if arrname==foodname{
                standard = String(group["item1"] ?? "")
                break
                }
        }
        var unit: Double = Double(standard) ?? 0.0
        if unit == 0{
            output.text = String("Sorry to resource cab/100g for this food ")
            return
        }
        var level = carbRatio_value*insulin_value
        if level == 0{
            output.text = String("Need more data on CarbRation or Insulin")
            return
        }
        food_value = food_value + thisfood*unit
        print(food_value)
        print(level)
        if food_value>level{
            output.text = String("Cab in all food \(food_value), exceeding the estimate level \(level), better eat less!")
            return
        }
        else{
            output.text = String("Cab in all food \(food_value), below the estimate level \(level), good job!")
            return
        }
    }
    
    
    @IBAction func carbRatio(_ sender: Any) {
        let carbRatio_new = Double(textInput!.text!) ?? 0
        print("carbRatio\(carbRatio_value)")
        if carbRatio_new <= 0{
            output.text = String("Wrong Carb Ratio Entered, please entered it again :)")
        }
        else if carbRatio_value == 0 && carbRatio_new > 0{
            output.text = String("Carb Ratio Entered! :)")
            carbRatio_value = carbRatio_new
        }
        else if carbRatio_new > 0{
            output.text = String("Carb Ratio Changed! :)")
            carbRatio_value = carbRatio_new
        }
        
    }
    
    @IBAction func takePicture(){
        let vc = storyboard?.instantiateViewController(identifier: "tp_vc") as! takePicture
        present(vc,animated:true)
    }
    
}



