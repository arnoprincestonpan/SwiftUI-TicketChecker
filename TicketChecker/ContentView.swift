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
                        var acceptable: Bool = !(age >= 13)
                        let ticketCost: Double = 30
                        let total: Double = Double(quantity * Int(ticketCost))
                        if money >= total && age >= 13 {
                            acceptable.toggle()
                        }
                        if acceptable {
                            print(acceptable)
                            if money >= total {
                                result += "You have enough cash to purchase \(quantity) ticket(s). You have \(money) for \(total) cost of ticket(s) at \(ticketCost) each. At \(age) you are allowed to watch the movie rated for 13 and over. Please take your tickets and be at least 15 min. early before the movie."
                            } else {
                                result += "You do not have enough cash to purchase \(quantity) ticket(s). You have \(money) for \(total) cost of ticket(s) at \(ticketCost) each. At \(age) you are allowed to watch the movie rated for 13 and over. Please take your tickets and be at least 15 min. early before the movie."
                            }
                        } else {
                            result += "You are not allowed to purchase ticket(s) at \(age) of age. The movie is only for 13 and over."
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
