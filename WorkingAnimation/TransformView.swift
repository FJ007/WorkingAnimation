//
//  TransformView.swift
//  WorkingAnimation
//
//  Created by Javier Fernández on 07/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import SwiftUI

struct TransformView: View {
    
    @State private var isAnimationBegin = false
    @State private var isPlay = false
    
    var body: some View {
        VStack {
            Text("Transform Shapes")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
            ZStack{
                RoundedRectangle(cornerRadius: 40)
                    .frame(width: isAnimationBegin ? 80 : 250, height: 80)
                    .foregroundColor(isPlay ? .red : .blue  )
                .overlay(
                    Image(systemName: isPlay ? "pause.fill" : "play.fill")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                )
            }
        }.onTapGesture {
            withAnimation(Animation.default) {
                self.isAnimationBegin.toggle()
            }
            withAnimation(Animation.easeInOut(duration: 1)) {
                self.isPlay.toggle()
            }
        }
    }
}

struct TransformView_Previews: PreviewProvider {
    static var previews: some View {
        TransformView()
    }
}
