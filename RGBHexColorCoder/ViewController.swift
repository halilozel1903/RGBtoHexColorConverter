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

    enum Conversion {
        case hexToRGB
        case rgbToHex
    }

    var conversion: Conversion = .hexToRGB

    override func viewDidLoad() {
        super.viewDidLoad()
        configureForCurrentConversion()
    }

    @IBAction func selectSegmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            conversion = .hexToRGB
        case 1:
            conversion = .rgbToHex
        default:
            conversion = .hexToRGB
        }

        clearInputAndResult()
        configureForCurrentConversion()
    }

    @IBAction func convertAction(_ sender: UIButton) {
        switch conversion {
        case .hexToRGB:
            convertHexToRGB()
        case .rgbToHex:
            convertRGBToHex()
        }
    }

    private func convertHexToRGB() {
        guard
            let red = parseHexComponent(redTextField.text),
            let green = parseHexComponent(greenTextField.text),
            let blue = parseHexComponent(blueTextField.text),
            let alpha = parseAlpha(alphaTextField.text)
        else {
            showValidationError(for: .hexToRGB)
            return
        }

        resultsLabel.text = "Red: \(red)\nGreen: \(green)\nBlue: \(blue)\nAlpha: \(alpha)"
        view.backgroundColor = color(red: red, green: green, blue: blue, alpha: alpha)
    }

    private func convertRGBToHex() {
        guard
            let red = parseRGBComponent(redTextField.text),
            let green = parseRGBComponent(greenTextField.text),
            let blue = parseRGBComponent(blueTextField.text),
            let alpha = parseAlpha(alphaTextField.text)
        else {
            showValidationError(for: .rgbToHex)
            return
        }

        let hexCode = String(format: "#%02X%02X%02X", red, green, blue)
        resultsLabel.text = "Hex Code: \(hexCode)\nAlpha: \(alpha)"
        view.backgroundColor = color(red: red, green: green, blue: blue, alpha: alpha)
    }

    private func configureForCurrentConversion() {
        switch conversion {
        case .hexToRGB:
            conversionButton.setTitle("Convert Hex to RGB", for: .normal)
            redTextField.placeholder = "Red (00-FF)"
            greenTextField.placeholder = "Green (00-FF)"
            blueTextField.placeholder = "Blue (00-FF)"
        case .rgbToHex:
            conversionButton.setTitle("Convert RGB to Hex", for: .normal)
            redTextField.placeholder = "Red (0-255)"
            greenTextField.placeholder = "Green (0-255)"
            blueTextField.placeholder = "Blue (0-255)"
        }

        alphaTextField.placeholder = "Alpha (0.0-1.0)"
        alphaTextField.keyboardType = .decimalPad
        redTextField.keyboardType = .numbersAndPunctuation
        greenTextField.keyboardType = .numbersAndPunctuation
        blueTextField.keyboardType = .numbersAndPunctuation
    }

    private func clearInputAndResult() {
        redTextField.text = ""
        greenTextField.text = ""
        blueTextField.text = ""
        alphaTextField.text = ""
        resultsLabel.text = "Result"
    }

    private func parseHexComponent(_ text: String?) -> UInt8? {
        guard var value = text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty else {
            return nil
        }

        if value.hasPrefix("#") {
            value.removeFirst()
        }

        guard value.count <= 2 else {
            return nil
        }

        return UInt8(value, radix: 16)
    }

    private func parseRGBComponent(_ text: String?) -> UInt8? {
        guard let value = text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty else {
            return nil
        }

        guard let component = Int(value), (0...255).contains(component) else {
            return nil
        }

        return UInt8(component)
    }

    private func parseAlpha(_ text: String?) -> CGFloat? {
        guard let rawValue = text?.trimmingCharacters(in: .whitespacesAndNewlines), !rawValue.isEmpty else {
            return nil
        }

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        let alphaValue = formatter.number(from: rawValue)?.doubleValue
            ?? {
                formatter.locale = Locale(identifier: "en_US_POSIX")
                return formatter.number(from: rawValue)?.doubleValue
            }()

        guard let alpha = alphaValue, (0...1).contains(alpha) else {
            return nil
        }

        return CGFloat(alpha)
    }

    private func color(red: UInt8, green: UInt8, blue: UInt8, alpha: CGFloat) -> UIColor {
        return UIColor(
            red: CGFloat(red) / 255,
            green: CGFloat(green) / 255,
            blue: CGFloat(blue) / 255,
            alpha: alpha
        )
    }

    private func showValidationError(for conversion: Conversion) {
        switch conversion {
        case .hexToRGB:
            resultsLabel.text = "Please enter valid hex values (00-FF) and alpha between 0 and 1."
        case .rgbToHex:
            resultsLabel.text = "Please enter valid RGB values (0-255) and alpha between 0 and 1."
        }
    }
}
