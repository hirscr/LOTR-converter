//
//  ExchangeInfo.swift
//  LOTR Converter
//
//  Created by Robert Hirsch on 12/6/22.
//

import SwiftUI

struct ExchangeInfo: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        let blather :String =
        "The Prancing Pony is a place where you can exchange your money to satisfy the overlords who rule over tyou and force you to give you their money.  So when King Algeronn says to pay him in Silver pennies and Queen Durisca wants gold pieces but you get paid in copper pieces, come here and we will make all the exchanges for you"
        
        
        ZStack { //overall screen
            Image("parchment")
                .resizable()
                .background(.brown)
                .edgesIgnoringSafeArea(.all)
            VStack{
                //exchange rate text
                Text("Exchange Rates")
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 7.0)
                // blah blah
                Text(blather)
                    .padding([.leading, .bottom, .trailing], 25.0)
                
                //exchange rates
                VStack {
                    
                    //gold piece to pennies
                    ExchangeRate(left_image: "goldpiece", conversion_text: "1 Gold Piece = 4 Gold Pennies", right_image: "goldpenny")
                    
                    ExchangeRate(left_image: "goldpenny", conversion_text: "1 Gold Penny = 4 Silver Pieces", right_image: "silverpiece")
                    
                    ExchangeRate(left_image: "silverpiece", conversion_text: "1 Silver Piece = 4 Silver Pennies", right_image: "silverpenny")
                    
                    ExchangeRate(left_image: "silverpenny", conversion_text: "1 Silver Penny = 100 Copper Pennies", right_image: "copperpenny")
                    
                }
                .padding(.bottom, 24.0)
                
                //done button
                Button {
                    // press for exchange rate screen
                    dismiss()
                    } label: {
                        Text("Done")
                        }
                        .font(.largeTitle)
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.brown)
                        .cornerRadius(15)
            }
            .foregroundColor(.black)
        }
        

        
    }
}

struct ExchangeInfo_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeInfo()
        
    }
}
