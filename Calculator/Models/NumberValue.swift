// ------------------- NumberValue

// Getting one digit at a time, constructing a number

struct NumberValue {
  private(set) var value: String?

  mutating func addDigit ( digit: String) {

    if digit == "." {
        if value == nil {
        value = "0."
        } else {
        if !value!.contains(".") {
            value! += "."
        }
        }
    } else {
        if value == nil {
        value = digit
        } else {
        value! += digit
        }
    }
  }

  mutating func clear() {
    value = nil
  }
}