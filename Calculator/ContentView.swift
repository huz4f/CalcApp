//
//  CalculatorApp.swift
//  Calculator
//
//  Created by huz4f on 02/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var currentValue : String = ""
    var body: some View {
        ZStack {
            Color.black
            VStack {
                TotalText (Value: currentValue)
                ButtonGrid(currentValue: $currentValue)
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
