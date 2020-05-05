//
//  ProgressView.swift
//  WorkingAnimation
//
//  Created by Javier Fernández on 05/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import SwiftUI

struct ProgressView: View {
    
    @State private var progressValue: CGFloat = 0.0
    
    var body: some View {
        VStack{
             Text("Progress Bar Circle")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .foregroundColor(.secondary)
            ZStack{
                Text("\(Int(progressValue * 100))%")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .foregroundColor(Color(self.progressValue < 1.0 ? .systemGray4 : .black))
                Circle()
                    .stroke(Color(.systemGray6), lineWidth: 20)
                    .frame(width: 200, height: 200, alignment: .center)
                Circle()
                    .trim(from: 0, to: progressValue)
                    .stroke(Color(self.progressValue < 1.0 ? .systemGreen : .systemBlue),
                            style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .frame(width: 200, height: 200, alignment: .center)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.default)
            }
        }.onAppear(){
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
                self.progressValue += 0.01
                if self.progressValue >= 1.0 {
                    timer.invalidate()
                }
            }
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
