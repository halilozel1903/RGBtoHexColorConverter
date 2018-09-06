//
//  ViewController.swift
//  RGBHexColorCoder
//
//  Created by Halil Özel on 4.09.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var alphaTextField: UITextField!
    @IBOutlet weak var conversionButton: UIButton!
    @IBOutlet weak var resultsLabel: UILabel!
    
    enum Conversion{
        
        case hexToRGB
        case RGBToHex
    }
    
    var conversion : Conversion = .hexToRGB
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    @IBAction func selectSegmentAction(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
        conversion = .hexToRGB
            conversionButton.setTitle("Convert hex to RGB", for: .normal)
            
        case 1 :
          conversion = .RGBToHex
            conversionButton.setTitle("Convert RGB to hex", for: .normal)
        default:
            conversion = .hexToRGB
            conversionButton.setTitle("Convert hex to RGB", for: .normal)
        }
        
        print(conversion)
        redTextField.text?.removeAll()
        greenTextField.text?.removeAll()
        blueTextField.text?.removeAll()
        alphaTextField.text?.removeAll()
    }
    
    @IBAction func convertAction(_ sender: UIButton) {
        
        guard let redText = redTextField.text else {return}
        guard let greenText = greenTextField.text else {return}
        guard let blueText = blueTextField.text else {return}
        guard let alphaText = alphaTextField.text else {return}
        
        print("Text entered : \(redText), \(greenText), \(blueText), \(alphaText)")
        
        
        switch conversion {
        case .hexToRGB:
            convertHexToRGB()
        case .RGBToHex:
            convertRGBToHex()
        }
    }
    
    func convertHexToRGB(){
        
    }
    
    func convertRGBToHex()  {
    
    }
    
}

