//
//  ContentView.swift
//  WorkingAnimation
//
//  Created by Javier Fernández on 04/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

// https://easings.net/


import SwiftUI

struct ContentView: View {
    
    @State private var backgroundColorChanged = false
    @State private var iconColorChanged = false
    @State private var iconSizeChanged = false
    @State private var iconChanged = false
    
    var body: some View {
        VStack{
            Text("Implicit Animations")
                .fontWeight(.heavy)
                .font(.largeTitle)
            ZStack{
                Circle()
                    .frame(width: 250, height: 250, alignment: .center)
                    .foregroundColor(backgroundColorChanged ? .blue : .green)
                Image(systemName: "alarm.fill")
                    .font(.system(size: 150))
                    .foregroundColor(iconSizeChanged ? .white : .black)
                    .scaleEffect(iconSizeChanged ? 1.0 : 0.5)
            }.onTapGesture {
                self.backgroundColorChanged.toggle()
                self.iconSizeChanged.toggle()
                self.iconColorChanged.toggle()
            }
            .animation(.default)
            
            Text("Explicit Animations")
                .fontWeight(.heavy)
                .font(.largeTitle)
            ZStack{
                Circle()
                    .frame(width: 250, height: 250, alignment: .center)
                    .foregroundColor(backgroundColorChanged ? .red : .gray)
                Image(systemName: iconChanged ? "heart.fill" : "heart")
                    .font(.system(size: 150))
                    .foregroundColor(iconSizeChanged ? .white : .black)
                    .scaleEffect(iconSizeChanged ? 1.0 : 0.5)
            }.onTapGesture {
                withAnimation (.spring(response: 0.3,
                                       dampingFraction: 0.3,
                                       blendDuration: 0.5)) {
                    self.iconSizeChanged.toggle()
                    self.iconChanged.toggle()
                }
                self.iconColorChanged.toggle()
                self.backgroundColorChanged.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
