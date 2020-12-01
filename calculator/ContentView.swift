//
//  ContentView.swift
//  calculator
//
//  Created by Александр on 30.11.2020.
//

import SwiftUI

struct ContentView: View {
  
  @State var labelStr = "0"
  @State var firstNum = ""
  @State var secondNum = ""
  @State var operation = ""
  @State var isFirst = true
  @State var isOperationClick = false
  
  let spacingGap: CGFloat = 10.0
  let buttons: [[CalcButton]] = CalcButtons
  
  var body: some View {
    ZStack(alignment: .bottom) {
      Color.black.ignoresSafeArea(.all)
      
      VStack {
        
        HStack {
          Spacer()
          Text(labelStr)
            .foregroundColor(.white)
            .font(.system(size: 64))
        }.padding()
        
        ForEach(0...buttons.count - 1, id: \.self) { index in
          
          HStack(spacing: spacingGap) {
            ForEach(buttons[index]) { calcBtn in
              
              Button(action: {
                onClickBtn(btn: calcBtn)
              }) {
                btnRef(calcBtn: calcBtn)
              }

            }.padding(.bottom, spacingGap)
          }
        }
      }
    }
  }
  
  func computeBtnHeight(btn: CalcButton) -> CGFloat {
    return (UIScreen.main.bounds.width - spacingGap * 5) / 4
  }
  
  func computeBtnWidth(btn: CalcButton) -> CGFloat {
    let part = (UIScreen.main.bounds.width - spacingGap * 5) / 4
    return btn.effect == "result" ? part * 2 : part
  }
  
  func setBtnColor(type: String) -> UIColor {
    switch type {
    case "number":
      return UIColor.darkGray
    case "action":
      return UIColor.systemIndigo
    default:
      return UIColor.darkGray
    }
  }
  
  func btnRef(calcBtn: CalcButton) -> some View {
    return Text(calcBtn.char)
      .font(.system(size: 32))
      .foregroundColor(Color.white)
      .frame(
        width: computeBtnWidth(btn: calcBtn),
        height: computeBtnHeight(btn: calcBtn)
      )
      .background(Color.init(
        setBtnColor(type: calcBtn.type)
      ))
      .cornerRadius(computeBtnWidth(btn: calcBtn))
  }
  
  func onClickBtn(btn: CalcButton) {
    switch btn.effect {
    case "default":
      self.setNewNumber(btn: btn)
    case "reset":
      self.resetState()
    case "result":
      self.computeResult()
    default:
      self.addEffect(btn: btn)
    }
  }
  
  func setNewNumber(btn: CalcButton) {
    if (isFirst) {
      labelStr = labelStr == "0" ? btn.char : labelStr + btn.char
      firstNum = labelStr
    } else {
      labelStr = isOperationClick ? btn.char : labelStr + btn.char
      secondNum = labelStr
      isOperationClick = false
    }
  }
  
  func addEffect(btn: CalcButton) {
    if (isFirst) {
      firstNum = labelStr
      labelStr = btn.char
      operation = btn.char
      isFirst = false
      isOperationClick = true
    }
  }
  
  func computeResult() {
    if (operation == "+") {
      labelStr = String(Int(firstNum)! + Int(secondNum)!)
    }
//    labelStr = "f: \(firstNum), o: \(operation), s: \(secondNum)"
  }
  
  func resetState() {
    labelStr = "0"
    firstNum = ""
    secondNum = ""
    operation = ""
    isFirst = true
    isOperationClick = false
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
