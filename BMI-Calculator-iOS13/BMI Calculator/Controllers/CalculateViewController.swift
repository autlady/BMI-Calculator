import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!

    @IBOutlet weak var weightSlider: UISlider!

    @IBAction func heightSliderChanged(_ sender: UISlider) {

        heightLabel.text = String(format:"%.2fm", sender.value)
    }

    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = String(Int(sender.value)) + "Kg"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}
