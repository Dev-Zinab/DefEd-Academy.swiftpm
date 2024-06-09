//
//  BiologyV.swift
//  DefEd Academy
//
//  Created by Zinab Zooba on 11/08/1445 AH.
//

import SwiftUI
import TipKit

struct BioWord: SearchableWord {
    let id = UUID()
    let imageName: String
    let text: String
    let videoFileName: String
}

struct BiologyV: View {

    let words = [
        BioWord(imageName: "Cell", text: "Cell", videoFileName: "Cell"),
        BioWord(imageName: "Mitochondria", text: "Mitochondria", videoFileName: "Mitochondria"),
        BioWord(imageName: "Ribosome", text: "Ribosome", videoFileName: "Ribosome"),
        BioWord(imageName: "Nucleus", text: "Nucleus", videoFileName: "Nucleus"),
        BioWord(imageName: "Red Cell", text: "Red blood cell", videoFileName: "Red Cell"),
        BioWord(imageName: "Virus", text: "Virus", videoFileName: "Virus"),
        BioWord(imageName: "Inheritance", text: "Inheritance", videoFileName: "Inheritance"),
        BioWord(imageName: "DNA", text: "DNA", videoFileName: "DNA")
    ]

    @State private var searchText = ""
    @State private var isShowingVideoPlayer = false
    @State private var selectedVideoFileName = ""
    let searchTip = SearchTip()

    var body: some View {
        NavigationStack {
            ZStack {
                Color("bg") // لون خلفية الشاشة
                    .ignoresSafeArea()

                VStack {

                    ScrollView{
                        LazyVStack {
                            ForEach(searchResults) { bioWord in
                                BioWordRow(bioWord: bioWord) {
                                    isShowingVideoPlayer = true
                                    selectedVideoFileName = bioWord.videoFileName
                                    
                                }
                            }.popoverTip(searchTip)
                                .onTapGesture {
                                    searchTip.invalidate(reason: .actionPerformed)
                                }
                        }}
                    .searchable(text: $searchText, prompt: "What word you want to learn?")
                    .listStyle(InsetGroupedListStyle())
                    .navigationTitle("Biology")
                    .navigationBarTitleDisplayMode(.automatic)
                    .sheet(isPresented: $isShowingVideoPlayer) {
                        VideoPlayerView(videoFileName: selectedVideoFileName)
                    }

                }
                
            }
        }
    }

    var searchResults: [BioWord] {
        if searchText.isEmpty {
            return words
        } else {
            return words.filter { $0.text.lowercased().contains(searchText.lowercased()) }
        }
    }
}


struct BiologyV_Previews: PreviewProvider {
    static var previews: some View {
        BiologyV()
    }
}


