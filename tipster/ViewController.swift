//
//  ViewController.swift
//  tipster
//
//  Created by Patrick Hayes on 11/1/17.
//  Copyright © 2017 Patrick Hayes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var smallPercent: UILabel!
    @IBOutlet weak var mediumPercent: UILabel!
    @IBOutlet weak var largePercent: UILabel!
    
    @IBOutlet weak var smallPerPerson: UILabel!
    @IBOutlet weak var mediumPerPerson: UILabel!
    @IBOutlet weak var largePerPerson: UILabel!
    
    @IBOutlet weak var smallTotalBill: UILabel!
    @IBOutlet weak var mediumTotalBill: UILabel!
    @IBOutlet weak var largeTotalBill: UILabel!
    
    @IBOutlet weak var numberInput: UILabel!
    @IBOutlet weak var decimalKey: UIButton!
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var groupSizeSlider: UISlider!
    @IBOutlet weak var groupSizeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberInput.text = "0"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func keyPad(_ sender: UIButton) {
//        print(sender.tag)
        if numberInput.text == "0" && sender.tag < 10{
            numberInput.text = String(sender.tag)
        } else if numberInput.text == "0" && sender.tag == 12{
            numberInput.text = "0."
            sender.isEnabled = false
        } else if sender.tag < 10{
            if let inputNumber = numberInput.text {
                numberInput.text = inputNumber + String(sender.tag)
            }
        } else if sender.tag == 12{
            if let inputNumber = numberInput.text{
                numberInput.text = inputNumber + "."
                sender.isEnabled = false
            }
        } else if sender.tag == 11{
            numberInput.text = "0"
            decimalKey.isEnabled = true
        }
        calculate()
    }
    
    @IBAction func tipSlider(_ sender: UISlider) {
        smallPercent.text = String(round(tipSlider.value)) + "%"
        mediumPercent.text = String(round(tipSlider.value)+5) + "%"
        largePercent.text = String(round(tipSlider.value)+10) + "%"
        calculate()
        
    }
    
    @IBAction func groupSlider(_ sender: UISlider) {
        groupSizeLabel.text = "Group Size: " +  String(Int(round(groupSizeSlider.value)))
        calculate()
    }
    
    
    func calculate(){
        if let x = numberInput.text{
            let input = Double(x)
            let tip = Double(round(tipSlider.value))
            let group = Double(round(groupSizeSlider.value))
            let smallTip = (round((input! * (tip/100)/group)*100)/100)
            let smallBill = (round(((input! + smallTip)/group)*100))/100
            let mediumTip = (round((input! * ((tip+5)/100)/group)*100)/100)
            let mediumBill = (round(((input! + mediumTip)/group)*100))/100
            let largeTip = (round((input! * ((tip+10)/100)/group)*100)/100)
            let largeBill = (round(((input! + largeTip)/group)*100))/100
            
            smallPerPerson.text = String(smallTip)
            mediumPerPerson.text = String(mediumTip)
            largePerPerson.text = String(largeTip)
            
            smallTotalBill.text = String(smallBill)
            mediumTotalBill.text = String(mediumBill)
            largeTotalBill.text = String(largeBill)
        }
    }
    
}

