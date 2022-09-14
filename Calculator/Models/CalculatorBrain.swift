// CalculatorApp, ContentView, CalculatorBrain

import Foundation

// import SwiftUI

// func greet(_ something: String) -> String {
//   let greeting = "Hello, " + something + "!"
//   return greeting
// }

// operations
// + - * / exp +/- = sqrt pi sin cos .

struct CalculatorBrain {
  private var accumulator: Decimal?

  // what kinds of operations can we have
  enum Operation {
    case constant(Decimal) // When you have a constant you a decimal associated value
    case unaryOperator((Decimal) -> Decimal)
    case binaryOperator((Decimal, Decimal) -> Decimal)
    case equals
    case clear
  }

  var operations: [String : Operation] = [
    "+": .binaryOperator(+),
    "-": .binaryOperator(-),
    "*": .binaryOperator(*),
    "÷": .binaryOperator(/),
    "=": .equals,
    "C": .clear
  ]

  mutating func setOperand(_ operand: Decimal) {
    accumulator = operand
  }

  var displayText: String {
    return "\(accumulator ?? 0)"
  }

  mutating func performOperation (_ symbol: String) {
    if let operation = operations[symbol] {
      switch operation {
        case .constant(let value):
          accumulator = value
        case .unaryOperator(let function):
          if accumulator != nil {
            accumulator = function(accumulator!)
          }
        case .binaryOperator(let function):
          if accumulator != nil {
            operationInProgress = OperationInProgress(firstOperand: accumulator!, function: function)
          }
        case .equals:
          performOperationInProgress()
    
        case .clear:
          accumulator = nil
          operationInProgress = nil
      }
    }
  }

  mutating private func performOperationInProgress() {
    if accumulator != nil && operationInProgress != nil {
      accumulator = operationInProgress!.perform(with: accumulator!)
    }
  }

  private var operationInProgress: OperationInProgress?

  private struct OperationInProgress {
    let firstOperand: Decimal
    let function: (Decimal, Decimal) -> Decimal

    func perform(with secondOperand: Decimal) -> Decimal {
      return function(firstOperand,secondOperand)
    }
  }
}