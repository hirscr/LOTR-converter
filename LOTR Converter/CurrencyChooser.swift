//
//  CurrencyChooser.swift
//  LOTR Converter
//
//  Created by Robert Hirsch on 12/6/22.
//

import SwiftUI

struct CurrencyChooser: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var left_currency : Currency
    @Binding var right_currency : Currency
    
    var body: some View {
        ZStack{
            //background
            Image("parchment")
                .resizable()
                .background(.brown)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                //from currency
                CurrencyChoices(coin_text: "Select currency you are starting with",
                                currency : left_currency).previewLayout(.sizeThatFits)
                
                //to currency
                CurrencyChoices(coin_text: "Select currency you want to convert to",
                                currency : right_currency).previewLayout(.sizeThatFits)
                
                //done button
                Button {
                    
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
        }
    }
}

struct CurrencyChooser_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyChooser(left_currency: .constant(.silverPiece), right_currency: .constant(.goldPiece))
    }
}
