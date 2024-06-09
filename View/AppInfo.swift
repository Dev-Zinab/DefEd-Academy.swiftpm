//
//  OnboardingView.swift
//  DefEd Academy
//
//  Created by Zinab Zooba on 12/08/1445 AH.
//

import SwiftUI

struct AppInfo: View {
    @State private var currentPage = 0

    var body: some View {
      
        NavigationStack{
            ZStack{
                Color(.pg)
                
                    .ignoresSafeArea()
                TabView(selection: $currentPage) {
                    AppInfoV(imageName: "info", title: "Welcome to DefEd academy", description: "Where we empowering Deaf and hard of hearing learners through sign language for an inclusive and accessible education!")
                        .tag(0)
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                VStack{
                    Spacer()

                }}}



            }
        }
struct AppInfoV: View {
    var imageName: String
    var title: String
    var description: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(height: 400)
                .padding()
                .accessibilityLabel("A girl falls from the sky with a science book")

            Text(title)
                .multilineTextAlignment(.center)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(.text))
                .fixedSize(horizontal: false, vertical: true)
                .accessibilityLabel("Welcome to DefEd academy")
                



            Text(description)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.text))
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .accessibilityLabel("Where we empowering Deaf and hard of hearing learners through sign language for an inclusive and accessible education!")




        }
        .padding()
    }
}

struct AppInfo_Previews: PreviewProvider {
    static var previews: some View {
        AppInfo()
    }
}

