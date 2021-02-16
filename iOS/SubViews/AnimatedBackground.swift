//
//  AnimatedBackground.swift
//  LabTalks
//
//  Created by Sascha Sallès on 16/02/2021.
//

import SwiftUI

struct AnimatedBackground: View {
    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 4, y: 0)
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    let colors = [Color(#colorLiteral(red: 0.1244810298, green: 0.1984634399, blue: 0.3261451125, alpha: 1)), Color(#colorLiteral(red: 0.1125099916, green: 0.1603941221, blue: 0.3757450064, alpha: 1)), Color(#colorLiteral(red: 0.08556153169, green: 0.1475736123, blue: 0.2967944588, alpha: 1)), Color(#colorLiteral(red: 0.3385225086, green: 0.3385225086, blue: 0.3385225086, alpha: 1)), Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))]
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
            .animation(Animation.easeInOut(duration: 6).repeatForever())
            .onReceive(timer, perform: { _ in
                
                self.start = UnitPoint(x: 4, y: 0)
                self.end = UnitPoint(x: 0, y: 2)
                self.start = UnitPoint(x: -4, y: 20)
                self.start = UnitPoint(x: 4, y: 0)
            })
    }
}

