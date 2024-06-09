//
//  MathV.swift
//  DefEd Academy
//
//  Created by Zinab Zooba on 11/08/1445 AH.
//

import SwiftUI
import TipKit

struct MathV: View {
    @State private var isSheetActive = false

    let words = [
        MathWord(imageName: "Acute Angle", text: "Acute Angle", videoFileName: "Acute Angle"),
        MathWord(imageName: "Axis", text: "Axis", videoFileName: "Axis"),
        MathWord(imageName: "Bar Graph", text: "Bar Graph", videoFileName: "Bar Graph"),
        MathWord(imageName: "Fraction", text: "Fraction", videoFileName: "Fraction"),
        MathWord(imageName: "Inverse", text: "Inverse", videoFileName: "Inverse"),
        MathWord(imageName: "Parallel Line", text: "Parallel", videoFileName: "Parallel"),
        MathWord(imageName: "Pi", text: "Pi", videoFileName: "Pi"),
        MathWord(imageName: "Root", text: "Square Root", videoFileName: "Root")
    ]

    @State private var searchText = ""
    @State private var isShowingVideoPlayer = false
    @State private var selectedVideoFileName = ""
    let searchTip = SearchTip()


    var body: some View {

        NavigationStack {
            ZStack {
                Color("bg")
                    .ignoresSafeArea()
                
                VStack {
                    
                    ScrollView {
                        LazyVStack {
                            
                            ForEach(searchResults) { mathWord in
                                MathWordRow(mathWord: mathWord){  isShowingVideoPlayer = true
                                    selectedVideoFileName = mathWord.videoFileName
                                    
                                }
                            }   .popoverTip(searchTip)
                                .onTapGesture {
                                    searchTip.invalidate(reason: .actionPerformed)
                                }
                        }
                    }
                        .searchable(text: $searchText, prompt: "What word you want to learn?")
                    
                        .listStyle(InsetGroupedListStyle())
                        .navigationBarTitle("Math", displayMode: .large)
                        .navigationBarBackButtonHidden(false)
                        .navigationBarTitleDisplayMode(.automatic)
                        .sheet(isPresented: $isShowingVideoPlayer) {
                            VideoPlayerView(videoFileName: selectedVideoFileName)
                     
            }

                }
            }

                }
            }
        
    

    var searchResults: [MathWord] {
        if searchText.isEmpty {
            return words
        } else {
            return words.filter { $0.text.lowercased().contains(searchText.lowercased()) }
        }
    }
}


struct MathV_Previews: PreviewProvider {
    static var previews: some View {
        MathV()
    }
}
