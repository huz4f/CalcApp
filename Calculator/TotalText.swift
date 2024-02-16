//
//  TotalText.swift
//  Calculator
//
//  Created by huz4f on 02/15/24.
//

import SwiftUI

struct TotalText: View {
    var Value = "0"
    var body: some View {
        Text(Value)
            .font(.system(size: 69))
            .foregroundColor(.white)
            .padding()
            .frame(width:300, alignment: .trailing)
            .lineLimit(1)
    }
}

#Preview {
    TotalText()
        .background(.black)
}
