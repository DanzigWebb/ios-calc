//
//  ContentView.swift
//  calculator
//
//  Created by Александр on 30.11.2020.
//

import SwiftUI

struct ContentView: View {
    
    let buttons = [
        ["C", "+", "%", "/"],
        ["7", "8", "9", "x"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "3", "="]
    ]
    
    let spacingGap: CGFloat = 10.0
    
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
                
                ForEach(buttons, id: \.self) { line in
                    HStack(spacing: self.spacingGap) {
                        ForEach(line, id: \.self) { button in
                            Text(button)
                                .font(.system(size: 32))
                                .foregroundColor(Color.white)
                                .frame(width: self.btnSize(), height: self.btnSize())
                                .background(Color.yellow)
                                .cornerRadius(self.btnSize())
                        }.padding(.bottom, self.spacingGap)
                    }
                }
            }
        }
    }
    
    func btnSize() -> CGFloat {
        return (UIScreen.main.bounds.width - spacingGap * 5) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
