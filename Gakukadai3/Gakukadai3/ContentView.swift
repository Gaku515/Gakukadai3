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
    @State var switchAnswerText1 = ""
    @State var switchAnswerText2 = ""
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
                let switchAnswer1 = changeNum(number1) * (flag1 ? -1 : 1)
                let switchAnswer2 = changeNum(number2) * (flag2 ? -1 : 1)

                switchAnswerText1 = "\(switchAnswer1)"
                switchAnswerText2 = "\(switchAnswer2)"

                resultText = "\(switchAnswer1 + switchAnswer2)"
            }
            HStack {
                Text(switchAnswerText1)
                Text("＋")
                    .padding()
                Text(switchAnswerText2)
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
