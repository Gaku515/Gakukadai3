//
//  ContentView.swift
//  Gakukadai3
//
//  Created by 中川岳 on 2022/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var number1 = ""
    @State var number2 = ""
    @State var flag1 = false
    @State var flag2 = false
    @State var switchAnswer1 = ""
    @State var switchAnswer2 = ""
    @State var resultText = ""
    func changeNum(_ text: String) -> Int {
        Int(text) ?? 0
    }
    var body: some View {
        VStack {
            HStack {
                CustomTextField(number: $number1, flag: $flag1)
                CustomTextField(number: $number2, flag: $flag2)
            }
            
            Button("Button") {
                if flag1==true {
                    switchAnswer1="-\(changeNum(number1))"
                } else {
                    switchAnswer1="\(changeNum(number1))"
                }
                if flag2==true {
                    switchAnswer2="-\(changeNum(number2))"
                } else {
                    switchAnswer2="\(changeNum(number2))"
                }
                resultText="\(changeNum(switchAnswer1)+changeNum(switchAnswer2))"
            }
            HStack {
                Text(switchAnswer1)
                Text("＋")
                    .padding()
                Text(switchAnswer2)
            }
            .padding(2)
            Text(resultText)
        }
    }
}

struct CustomTextField: View {
    @Binding var number: String
    @Binding var flag: Bool
    var body: some View {
        VStack {
            TextField("", text: $number)
                .frame(width: 100, height: 25)
                .border(Color.black, width: 1)
                .keyboardType(.numberPad)
            HStack {
                Text("+")
                Toggle("", isOn: $flag)
                    .labelsHidden()
                Text("-")
            }
        }
        .padding()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
