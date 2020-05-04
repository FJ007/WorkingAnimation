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
    
    @State var backgroundColorChanged = false
    @State var iconColorChanged = false
    @State var iconSizeChanged = false
    
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
            .animation(.interactiveSpring(response: 0.2,
                                          dampingFraction: 0.3,
                                          blendDuration: 0.8))
            //.animation(.default)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
