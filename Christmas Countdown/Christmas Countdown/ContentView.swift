//
//  ContentView.swift
//  Christmas Countdown
//
//  Created by SaulUrias on 07/07/20.
//  Copyright © 2020 SaulUrias. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var nowDate: Date = Date()
    
    let referenceDate: Date
    
    private var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    
    var body: some View {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
            VStack {
                Image("santa-hat")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text(countDownString(from: referenceDate))
                    .font(Font.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                .onAppear(perform: { _ = self.timer })
            }
        }
    }
    
    private func countDownString(from date: Date) -> String {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.day, .hour, .minute, .second],
                            from: nowDate,
                            to: referenceDate)
        return String(format: "%02dd: %02dh: %02dm: %02ds",
                      components.day ?? 00,
                      components.hour ?? 00,
                      components.minute ?? 00,
                      components.second ?? 00)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(referenceDate: CustomDate.christmas)
    }
}
