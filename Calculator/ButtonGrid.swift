

import SwiftUI

enum operation{
    case noteset
    case add
    case sub
    case multiply
}

struct ButtonGrid: View {
    @Binding var currentValue : String
    @State var currentmode : operation = .noteset
    @State var lastwasmode = false
    @State var savedint = 0
    @State var currentint = 0
    
    
    var body: some View {
        Grid {
            GridRow {
                CalculatorButton(buttonText: "1",
                                 action: numberPressed)
                CalculatorButton(buttonText: "2",
                                 action: numberPressed)
                CalculatorButton(buttonText: "3",
                                 action: numberPressed)
                CalculatorButton(color: .orange, buttonText: "+",
                                 action: mode, op: .add)
            }
            GridRow {
                CalculatorButton(buttonText: "4",
                                 action: numberPressed)
                CalculatorButton(buttonText: "5",
                                 action: numberPressed)
                CalculatorButton(buttonText: "6",
                                 action: numberPressed)
                CalculatorButton(color: .orange, buttonText: "-",
                                 action: mode, op: .sub)
            }
            GridRow {
                CalculatorButton(buttonText: "7",
                                 action: numberPressed)
                CalculatorButton(buttonText: "8",
                                 action: numberPressed)
                CalculatorButton(buttonText: "9",
                                 action: numberPressed)
                CalculatorButton(color: .orange, buttonText: "x",
                                 action: mode, op: .multiply)
            }
            GridRow {
                CalculatorButton(width: 150, buttonText: "0",
                                 action: numberPressed)
                .gridCellColumns(2)
                CalculatorButton(color: .gray, buttonText: "C",
                                 action: clear)
                CalculatorButton(color: .orange, buttonText: "=",
                                 action: ans, fc: .black)
            }
        }
        
    }
    func numberPressed(button: CalculatorButton){
        if lastwasmode{
            lastwasmode = false
            currentint = 0
        }
        if let currentValueI = Int( "\(currentint)" + button.buttonText){
            currentint = currentValueI
            update()}
        else {
            currentValue = "rekt"
            currentint = 0}
    }
    func mode(button: CalculatorButton){
        currentmode = button.op
        lastwasmode = true
    }
    
    func clear(button: CalculatorButton){
        currentmode = .noteset
        lastwasmode = false
        savedint = 0
        currentint = 0
        currentValue = "hi"
    }
    
    func ans(button: CalculatorButton){
        if currentmode == .noteset || lastwasmode {
            return}
        if currentmode == .add{
            savedint += currentint}
        if currentmode == .sub{
            savedint -= currentint}
        if currentmode == .multiply{
            savedint *= currentint}
        currentint = savedint
        update()
        lastwasmode = true
    }
    
    func update(){
        if currentmode == .noteset{
            savedint = currentint
        }
        currentValue = "\(currentint)"
    }
}

struct ButtonGrid_Previews: PreviewProvider {
    @State static var currentValue = "1"
    static var previews: some View {
        ButtonGrid(currentValue: $currentValue)
    }
}
