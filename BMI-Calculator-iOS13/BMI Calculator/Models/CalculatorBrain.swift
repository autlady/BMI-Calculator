//
//  CalculationBrain.swift
//  BMI Calculator
//
//  Created by  Юлия Григорьева on 13.04.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {

    var bmi: BMI?

    mutating func calculateBMI(height: Float, weight: Float) {
            let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.systemIndigo)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor.red)
        }
    }

    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }

    func getAdvice() -> String {
        return bmi?.advice ?? "no advice"
    }

    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
}
}
