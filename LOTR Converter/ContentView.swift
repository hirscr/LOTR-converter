//
//  ContentView.swift
//  LOTR Converter
//
//  Created by Robert Hirsch on 12/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var left_amount = ""
    @State var right_amount = ""
    @State var left_currency : Currency = .silverPiece
    @State var right_currency : Currency = .goldPiece
    @State var show_select_currency : Bool = false
    @State var show_exchange_info : Bool = false
    @State var left_amount_temp = ""
    @State var right_amount_temp = ""
    @State var left_typing = false
    @State var right_typing = false
    
    
    var body: some View {
        ZStack {
            // background image
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                // pony image
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                
                // currency exchange
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                
                //conversion section
                
                
                HStack{
                    //left conversion
                    
                    VStack{
                        //currency
                        
                        HStack{
                            //curency image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: left_currency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: left_currency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            show_select_currency.toggle()
                        }
                        .sheet(isPresented: $show_select_currency){
                            CurrencyChooser(left_currency : $left_currency, right_currency: $right_currency)
                        }
                        
                        //left text field
                        TextField("Amount", text: $left_amount, onEditingChanged: {
                            typing in
                            left_typing = typing
                            left_amount_temp = left_amount
                        })
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .keyboardType(.decimalPad)
                            .onChange(of: left_typing ?  left_amount : left_amount_temp)
                        {
                            _ in
                            right_amount=left_currency.convert(amountString: left_amount, to: right_currency)
                        }
                        .onChange(of: left_currency) { _ in
                            left_amount = right_currency.convert(amountString: right_amount, to: left_currency)
                        }
                        
                    }
                    .padding(10.0)
                    
                    //equals
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    //right conversion
                    VStack{
                        //currency
                        
                        HStack{
                            //curency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: right_currency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            //currency image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: right_currency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            show_select_currency.toggle()
                        }
                        .sheet(isPresented: $show_select_currency){
                            CurrencyChooser(left_currency : $left_currency, right_currency: $right_currency)
                        }
                        //text field
                        TextField("amount", text: $right_amount, onEditingChanged: {typing in
                            right_typing = typing
                            right_amount_temp = right_amount
                        })
                            .padding(7.0)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .onChange(of: right_typing ? right_amount : right_amount_temp){ _ in
                                left_amount = right_currency.convert(amountString: right_amount, to: left_currency)
                            }
                            .onChange(of: right_currency) { _ in
                                right_amount = left_currency.convert(amountString: left_amount, to: right_currency)
                            }
                    }
                    .padding(10.0)
                    
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(50)
                Spacer()
                //info button
                HStack {
                    Spacer()
                    Button {
                        // press for exchange rate screen
                        show_exchange_info.toggle()
                        
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .sheet(isPresented: $show_exchange_info){
                        ExchangeInfo()
                        
                    }
                }
            }
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
