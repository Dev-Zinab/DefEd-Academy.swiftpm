//
//  ComputerM.swift
//  DefEd Academy
//
//  Created by Zinab Zooba on 12/08/1445 AH.
//

import SwiftUI

struct ComputerWord: Identifiable {
    let id = UUID()
    let imageName: String
    let text: String
    let videoFileName: String
}
struct ComputerWordRow: View {
    let computerWord: ComputerWord
    let playButtonAction: () -> Void
    @State private var isSheetActive = false

    var body: some View {
        HStack {
            Image(computerWord.imageName)
                .resizable()
                .frame(width: 65, height: 65)
                .padding()
                .onTapGesture {
                    withAnimation {
                        isSheetActive.toggle()
                    }
                } .accessibility(label: Text("Tap to zoom image\(computerWord.imageName)"))
                .accessibility(hint: Text("Tap to zoom image"))
                .accessibility(addTraits: .isButton)
                .frame(width: 77, height: 77)
                .background(Color(.main))
                .cornerRadius(8.5)
                .padding()



            Spacer()

            Text(computerWord.text)
                .fontWeight(.bold)
                .foregroundColor(Color(.text))
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
            } .accessibility(label: Text("Press the button to view the sign language translation \(computerWord.imageName)"))
               

        }
        Divider()



        .sheet(isPresented: $isSheetActive) {
            ZoomedImageFullScreen(imageName: computerWord.imageName, isSheetActive: $isSheetActive)
        }
    }
}

