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
        
    }
    
    @IBAction func convertAction(_ sender: UIButton) {
        
    }
    
}

