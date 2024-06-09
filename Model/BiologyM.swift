//
//  BiologyM.swift
//  DefEd Academy
//
//  Created by Zinab Zooba on 12/08/1445 AH.
//

import SwiftUI

struct BioWordRow: View {
    
    let bioWord: BioWord
    let playButtonAction: () -> Void
    @State private var isSheetActive = false

    var body: some View {
        HStack {
            
            Image(bioWord.imageName)
                .resizable()
                .frame(width: 65, height: 65)
                .padding()
                .onTapGesture {
                    withAnimation {
                        isSheetActive.toggle()
                    }
                }.accessibility(label: Text("Tap to zoom image\(bioWord.imageName)"))
                .accessibility(hint: Text("Tap to zoom image"))
                .accessibility(addTraits: .isButton)
                .frame(width: 77, height: 77)
                .background(Color(.main))
                .cornerRadius(8.5)
                .padding()


            Spacer()
            
            Text(bioWord.text)
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

            } .accessibility(label: Text("Press the button to view the sign language translation for \(bioWord.imageName)"))
        }
        Divider()

        .sheet(isPresented: $isSheetActive) {
            ZoomedImageFullScreen(imageName: bioWord.imageName, isSheetActive: $isSheetActive)
        }

    }
}
