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
}

let CalcButtons: [[CalcButton]] = [
  [
    CalcButton(type: "action", char: "C"),
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
    CalcButton(type: "number", char: "."),
    CalcButton(type: "action", char: "="),
  ]
]
