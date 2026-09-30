//
//  ContentView.swift
//  Assignment 6: VStack, HStack and ZStack
//  Author: Erick Ramos
//  Date: 9/26/26
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Text("3 x 3 Matrix")
                    .font(Font.largeTitle)
                    .bold()
                    .foregroundColor(.white)

                HStack{
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .overlay(Text("(0 , 0)").bold())
                    
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .overlay(Text("(0 , 1)").bold())
                    
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .overlay(Text("(0 , 2)").bold())
                }
                
                HStack{
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .overlay(Text("(1 , 0)").bold())
                    
                    Rectangle()
                        .fill(Color.purple)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .overlay(Text("(1 , 1)").bold())
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .overlay(Text("(1 , 2)").bold())
                }
                
                HStack{
                    Rectangle()
                        .fill(Color.cyan)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .overlay(Text("(2 , 0)").bold())
                    
                    Rectangle()
                        .fill(Color.brown)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .overlay(Text("(2 , 1)").bold())
                    
                    Rectangle()
                        .fill(Color.orange)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .overlay(Text("(2 , 2)").bold())
                }
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
