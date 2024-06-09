//
//  SplachScareen.swift
//  DefEd Academy
//
//  Created by Zinab Zooba on 12/08/1445 AH.
//

import SwiftUI


struct SplashScreenView: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    // Customise your SplashScreen here
    var body: some View {
        ZStack{
            Color(.pg)
                .ignoresSafeArea()
            if isActive {
                CoursesV()
            } else {
                VStack {
                    VStack {
                        Image("Splash")
                            .resizable()
                            .offset(y: size > 1 ? 0 : -100)                    .frame(width: 400, height: 400)
                            .padding()
                        Text("DefEd Academy")
                            .font(Font.custom("Baskerville-Bold", size: 30))
                            .foregroundColor(Color(.text))
                    }
                    .scaleEffect(x: 1, y: size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 1.2
                            self.opacity = 1.00
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
