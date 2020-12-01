//
//  CalcBtnsStruct.swift
//  calculator
//
//  Created by Александр on 30.11.2020.
//

import Foundation

struct CalcButton: Identifiable {
  var id = UUID()
  
  var type: String
  var char: String
  var effect = "default"
  
  init(type: String, char: String) {
    self.type = type
    self.char = char
    self.effect = self.setEffectByChar(char: char)
  }
  
  func setEffectByChar(char: String) -> String {
    switch char {
    case "CA":
      return "reset"
    case "+":
      return "addition"
    case "%":
      return "percent"
    case "/":
      return "division"
    case "x":
      return "multiply"
    case "-":
      return "subtraction"
    case "=":
      return "result"
    default:
      return "default"
    }
  }
}

let CalcButtons: [[CalcButton]] = [
  [
    CalcButton(type: "action", char: "CA"),
    CalcButton(type: "action", char: "+"),
    CalcButton(type: "action", char: "%"),
    CalcButton(type: "action", char: "/"),
  ],
  [
    CalcButton(type: "number", char: "7"),
    CalcButton(type: "number", char: "8"),
    CalcButton(type: "number", char: "9"),
    CalcButton(type: "action", char: "x"),
  ],
  [
    CalcButton(type: "number", char: "4"),
    CalcButton(type: "number", char: "5"),
    CalcButton(type: "number", char: "6"),
    CalcButton(type: "action", char: "-"),
  ],
  [
    CalcButton(type: "number", char: "1"),
    CalcButton(type: "number", char: "2"),
    CalcButton(type: "number", char: "3"),
    CalcButton(type: "action", char: "+"),
  ],
  [
    CalcButton(type: "number", char: "0"),
    CalcButton(type: "number", char: "."),
    CalcButton(type: "action", char: "="),
  ]
]
