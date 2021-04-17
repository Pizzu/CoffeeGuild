//
//  SuccessLog.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 16/4/21.
//

import SwiftUI

struct SuccessLog: View {
    
    @State private var show : Bool = false
    
    var body: some View {
           VStack {
               VStack(spacing: 0) {
                   Text("Logging you...")
                       .font(.title).bold()
                       .opacity(self.show ? 1 : 0)
                       .animation(Animation.linear(duration: 1).delay(0.2), value: self.show)
                   
                   LottieView(fileName: "success")
                       .frame(width: 300, height: 300)
                       .opacity(self.show ? 1 : 0)
                       .animation(Animation.linear(duration: 1).delay(0.4), value: self.show)
                   
               }
               .padding(.top, 30)
               .background(VisualEffectBlur(blurStyle: .systemMaterial))
               .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
               .shadow(color: Color.black.opacity(0.2), radius: 30, x: 0, y: 30)
               .scaleEffect(self.show ? 1 : 0.5)
               .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: self.show)
           }
           .frame(maxWidth: .infinity, maxHeight: .infinity)
           .background(Color.black.opacity(self.show ? 0.5 : 0))
           .animation(.linear(duration: 0.5), value: self.show)
           .edgesIgnoringSafeArea(.all)
           .onAppear {
               self.show = true
           }
           .onDisappear {
               self.show = false
           }
           
       }
}

struct SuccessLog_Previews: PreviewProvider {
    static var previews: some View {
        SuccessLog()
    }
}
