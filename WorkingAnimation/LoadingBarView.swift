//
//  LoadingBarView.swift
//  WorkingAnimation
//
//  Created by Javier Fernández on 05/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import SwiftUI

struct LoadingBarView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            Text("Cargando...")
                .fontWeight(.heavy)
                .font(.system(.title, design: .rounded))
                .foregroundColor(.gray)
                .multilineTextAlignment(.trailing)
                .offset(x: -70, y: 5)
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .circular)
                    .foregroundColor(Color(.systemGray6))
                    .frame(width: 300, height: 10, alignment: .center)
                RoundedRectangle(cornerRadius: 8, style: .circular)
                    .foregroundColor(.green)
                    .frame(width: 50, height: 10, alignment: .center)
                    .offset(x: isLoading ? 125 : -125, y: 0)
                    .animation(Animation.linear(duration: 1.5)
                        .repeatForever(autoreverses: false))
            }
        }.onAppear(){
            self.isLoading = true
        }
    }
}

struct LoadingBarView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingBarView()
    }
}
