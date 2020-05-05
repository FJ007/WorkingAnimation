//
//  DotsLoadingView.swift
//  WorkingAnimation
//
//  Created by Javier Fernández on 05/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import SwiftUI

struct DotsLoadingView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        VStack{
           Text("Please, wait.")
            .font(.system(.largeTitle, design: .rounded))
            .bold()
            .foregroundColor(.secondary)
            HStack{
                ForEach(0...5, id: \.self) { index in
                    Circle()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.blue)
                        .scaleEffect(self.isLoading ? 0 : 1)
                        .animation(Animation
                            .linear(duration: 1.0)
                            .repeatForever()
                            .delay(Double(index)/6))
                }
            }
        }.onAppear(){
            self.isLoading = true
        }
        
    }
}

struct DotsLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        DotsLoadingView()
    }
}
