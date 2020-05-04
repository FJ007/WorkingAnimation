//
//  LoadingView.swift
//  WorkingAnimation
//
//  Created by Javier Fernández on 04/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        VStack{
            Text("Loading Indicator")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
                .opacity(0.7)
            ZStack{
                Circle()
                    .stroke(Color(.systemGray6), lineWidth: 20)
                    .frame(width: 150, height: 150, alignment: .center)
                Circle()
                    .trim(from: 0.0, to: 0.90)
                    .stroke(Color.blue,
                            style: StrokeStyle(lineWidth: 15,
                                               lineCap: .round,
                                               lineJoin: .round))
                    .frame(width: 150, height: 150, alignment: .center)
                    .rotationEffect(Angle(degrees: isLoading ? 360.0 : 0))
                    .animation(Animation
                        .linear(duration: 2.0)
                        .repeatForever(autoreverses: false))
            }
        }.onAppear(){
            self.isLoading = true
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
