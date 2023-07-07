//
//  ContentView.swift
//  TicketChecker
//
//  Created by Arno Princeston pan on 2023-07-06.
//

import SwiftUI

struct ContentView: View {
    
    @State var age: Int = 0
    @State var money: Double = 0
    @State var quantity: Int = 0
    @State var result: String = ""
    
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea(.all, edges: .all)
            VStack{
                RoundedRectangle(cornerRadius: 8)
                    .fill(.blue)
                    .frame(width: .infinity, height: 64)
                    .padding(.vertical)
                    .overlay(
                        Text("Arno Pan Programming")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 24)
                    )
                Form{
                    LabeledContent{
                        TextField("Age", value: $age, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.trailing)
                    } label: {
                        Text("Age: ")
                    }
                    LabeledContent{
                        TextField("Money", value: $money, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.trailing)
                    } label: {
                        Text("Money: ")
                    }
                    LabeledContent {
                        TextField("Quantity", value: $quantity, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.trailing)
                        
                    } label: {
                        Text("Quantity: ")
                    }
                    
                    Button(action: {
                        result = ""
                        var acceptable: Bool = false
                        let ticketCost: Double = 30
                        let total: Double = Double(quantity * Int(ticketCost))
                        
                        if age >= 13 {
                            acceptable = true
                            result += "You are of age at \(age) for the age restriction of 13. "
                        } else {
                            result += "You are not of age at \(age). To purchase you must be at least 13. "
                        }
                        
                        if quantity >= 1 {
                            if money >= total {
                                result += "You have enough money at \(money). Which is enough to buy \(quantity) of ticket(s) at \(ticketCost) of a total of \(total). Congratulations, please proceed."
                            } else {
                                result += "You do not have enough money at \(money). You want to buy \(quantity) quantity of ticket(s) at \(ticketCost) each, at the total cost of \(total). Please prepare more cash or lower your quantity."
                            }
                        } else {
                            result += "You aren't buying any tickets at the quantity of \(quantity)."
                        }
                    

                    }) {
                        Text("Check for Eligibility.")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text(result)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
