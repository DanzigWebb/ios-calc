//
//  ContentView.swift
//  calculator
//
//  Created by Александр on 30.11.2020.
//

import SwiftUI

struct ContentView: View {
  
  let spacingGap: CGFloat = 10.0
  let buttons: [[CalcButton]] = CalcButtons
  
  var body: some View {
    ZStack(alignment: .bottom) {
      Color.black.ignoresSafeArea(.all)
      
      VStack {
        
        HStack {
          Spacer()
          Text("0")
            .foregroundColor(.white)
            .font(.system(size: 64))
        }.padding()
        
        ForEach(0...buttons.count - 1, id: \.self) { index in
          
          HStack(spacing: spacingGap) {
            ForEach(buttons[index]) { button in
              Text(button.char)
                .font(.system(size: 32))
                .foregroundColor(Color.white)
                .frame(
                  width: computeBtnSize(),
                  height: computeBtnSize()
                )
                .background(Color.init(
                  setBtnColor(type: button.type)
                ))
                .cornerRadius(computeBtnSize())
            }.padding(.bottom, spacingGap)
          }
        }
      }
    }
  }
  
  func computeBtnSize() -> CGFloat {
    return (UIScreen.main.bounds.width - spacingGap * 5) / 4
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
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
