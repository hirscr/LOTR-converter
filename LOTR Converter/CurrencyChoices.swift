//
//  CurrencyChoices.swift
//  LOTR Converter
//
//  Created by Robert Hirsch on 12/6/22.
//

import SwiftUI

struct CurrencyChoices: View {
    @State var gridlayout =  [GridItem(),GridItem(),GridItem()]
    @State var coin_text : String
    @State var currency : Currency
   
    func get_currency_selection() -> Currency {
        return self.currency
    }
    
    var body: some View {
        VStack {
            //text
            Text(coin_text)
            
            LazyVGrid(columns : gridlayout){
                ForEach(0..<5){ i in
                    if Currency.allCases[i] == currency {
                        CoinView(image: CurrencyImage.allCases[i].rawValue, text : CurrencyText.allCases[i].rawValue)
                            .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 3)
                                .opacity(0.5))
                            .shadow(color:.black,radius: 9)
                    }
                    else {
                        CoinView(image: CurrencyImage.allCases[i].rawValue, text : CurrencyText.allCases[i].rawValue)
                            .onTapGesture {
                                currency=Currency.allCases[i]
                            }
                    }
                }
            }
            .padding([.bottom,.leading,.trailing])

                  
        }
    }
}

struct CurrencyChoices_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyChoices(coin_text: "coin description", currency: .silverPiece).previewLayout(.sizeThatFits)
    }
}
