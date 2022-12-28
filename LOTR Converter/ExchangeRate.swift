//
//  exchangerate.swift
//  LOTR Converter
//
//  Created by Robert Hirsch on 12/6/22.
//

import SwiftUI

struct ExchangeRate: View {
    @State var left_image : String
    @State var conversion_text : String
    @State var right_image : String

    
    var body: some View {
        HStack{
            //GPcimage
            Image(left_image)
                .resizable()
                .frame(width: 25.0, height: 25.0)
               // .scaledToFit()
            
            //conversion text
            Text(conversion_text)
                 
            //GPn image
            Image(right_image)
                .resizable()
                .frame(width: 25.0, height: 25.0)

        }
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(left_image: "silverpiece", conversion_text: "1 silverpiece = 4 Silver Pennies", right_image: "silverpenny")
            .previewLayout(.sizeThatFits)
    }
}
