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
    
    // enum olusturma
    enum Conversion{
        
        case hexToRGB
        case RGBToHex
    }
    
    var conversion : Conversion = .hexToRGB // default nesneye değer atama
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    @IBAction func selectSegmentAction(_ sender: UISegmentedControl) {
        
        // değeri kontrol etme
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
        
        print(conversion) // değeri ekranda gösterme
        redTextField.text?.removeAll() // red alanını silme
        greenTextField.text?.removeAll() // green alanını silme
        blueTextField.text?.removeAll() // blue alanını silme
        alphaTextField.text?.removeAll() // alpha alanını silme
    }
    
    // dönüştürme işlemlerinin kontrolü ve başlatılması
    @IBAction func convertAction(_ sender: UIButton) {
        

        
        switch conversion {
        
        // hex to RGB değeri seçildiyse
        case .hexToRGB:
            // arka plan rengini değiştir metodu çağrılıyor.
            self.view.backgroundColor =  convertHexToRGB()
            
        // RGB to hex değeri seçildiyse
        case .RGBToHex:
            convertRGBToHex()
        }
    }
    
    // hex to RGB dönüşümü ile ilgili işlemler yapılıyor.
    func convertHexToRGB() -> UIColor?{
        
        // renk değerlerini hex türünde girilecek şekilde dizayn ediliyor.
        guard let redText = UInt8(redTextField.text!,radix : 16)  else {return nil}
        guard let greenText = UInt8(greenTextField.text!,radix : 16)  else {return nil}
        guard let blueText = UInt(blueTextField.text!,radix : 16) else {return nil}
        guard let alphaText = Float(alphaTextField.text!) else {return nil}
        
        // alfa değeri 1 ya da 0 ise değeri döndür.
        if alphaText > 1 || alphaText  < 0{
            return nil
        }
        
        // girilen değerleri consolda gösterme
        print("Text entered : \(redText), \(greenText), \(blueText), \(alphaText)")
        
        // labelde girilen renklerin dönüştürülmüş değerleri gözküyor.
        resultsLabel.text = "Red : \(redText)\n Green : \(greenText)\n Blue : \(blueText)\n Alpha : \(alphaText) "
        
        // arka plan renginin ayarlanması
        let backgroundColor = UIColor(red: CGFloat(Float(redText) / 255), green: CGFloat(Float(greenText) / 255), blue: CGFloat(Float(blueText) / 255), alpha: CGFloat(alphaText))
        
        // arka plan rengi döndürülüyor.
        return backgroundColor
    }
    
    func convertRGBToHex()  {
    
    }
    
}

