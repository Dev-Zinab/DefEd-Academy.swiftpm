//
//  MathM.swift
//  DefEd Academy
//
//  Created by Zinab Zooba on 12/08/1445 AH.
//

import Foundation
import SwiftUI
struct MathWord: Identifiable {
    let id = UUID()
    let imageName: String
    let text: String
    let videoFileName: String
}

struct MathWordRow: View {
    let mathWord: MathWord
    let playButtonAction: () -> Void
    @State private var isSheetActive = false


    var body: some View {
        HStack {

            Image(mathWord.imageName)
                .resizable()
                .frame(width: 65, height: 65)
                .padding()
                .onTapGesture {
                    withAnimation {
                        isSheetActive.toggle()
                    }
                } .accessibility(label: Text("Tap to zoom image\(mathWord.imageName)"))
                .accessibility(hint: Text("Tap to zoom image"))
                .accessibility(addTraits: .isButton)
                .frame(width: 77, height: 77)
                .background(Color(.main))
                .cornerRadius(8.5)
                .padding()



            Spacer()
            
            Text(mathWord.text)
                .foregroundColor(Color(.text))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Spacer()
            Spacer()

            Button(action: {
                playButtonAction()
            }) {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor (Color(.main))
                    .padding()

                    
            } .accessibility(label: Text("Press the button to view the sign language translation for \(mathWord.imageName)"))
        }
        Divider()
        .sheet(isPresented: $isSheetActive) {
            ZoomedImageFullScreen(imageName: mathWord.imageName, isSheetActive: $isSheetActive)
        }

    }
}
struct ZoomedImageFullScreen: View {
    let imageName: String
    @Binding var isSheetActive: Bool

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                // عند النقر على الصورة في النافذة المنبثقة، قم بإغلاقها
                isSheetActive = false
            }
    }
}

