import Foundation

extension CalculatorView {
    final class ViewModel: ObservableObject {
       @Published private var calculator = CalculatorBrain() 
       @Published private var number = NumberValue()

       // Pick what buttons to have
       var buttons: [[String]] {
        [
            ["7", "8", "9", "÷"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "*"],
            ["0", "=", "+"]

        ]
       }

        private var digits: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]

       // Functions that vill change the model
       func performAction(for button: String) {
        if digits.contains(button) {
            number.addDigit(button)
        } else {
            if number.value != nil {
            calculator.setOperand(Decimal(string: number.value!)!) // ^^^
            number.clear()
            }
        }
       }

       // Functions that will get the current value
        var displayText: String {
            if let value = number.value {
                return value
            } else {
                return calculator.displayText
            }
        }
    }
}