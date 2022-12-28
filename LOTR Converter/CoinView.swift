//
//  CoinView.swift
//  LOTR Converter
//
//  Created by Robert Hirsch on 12/6/22.
//

import SwiftUI

struct CoinView: View {
    
    @State var image : String
    @State var text : String
    
    var body: some View {
        
        VStack{
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width : 100.0, height: 100.0)
                .background(.brown)
                .cornerRadius(15)
            
            Text(text)
                .frame(width: 87.0)
                .background(.brown)
                .padding(-23.0)
                .font(/*@START_MENU_TOKEN@*/.caption/*@END_MENU_TOKEN@*/)
        }
        .padding(.top, 6.0)
        .frame(width: 100.0, height: 100.0)
        

    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView(image : "copperpenny", text : "Copper Penny")
            .previewLayout(.sizeThatFits)
    }
}
