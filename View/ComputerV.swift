//
//  ComputerV.swift
//  DefEd Academy
//
//  Created by Zinab Zooba on 11/08/1445 AH.
//

import SwiftUI
import TipKit

struct ComputerV: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isSheetActive = false

    let words = [
        ComputerWord(imageName: "Authentication", text: "Authentication", videoFileName: "Authentication"),
        ComputerWord(imageName: "Authorization", text: "Authorization", videoFileName: "Authorization"),
        ComputerWord(imageName: "Backdoor", text: "Backdoor", videoFileName: "Backdoor"),
        ComputerWord(imageName: "Internet", text: "Internet", videoFileName: "Internet"),

        ComputerWord(imageName: "Bluetooth", text: "Bluetooth", videoFileName: "Bluetooth"),
        ComputerWord(imageName: "Browser", text: "Browser", videoFileName: "Browser"),
        ComputerWord(imageName: "Data Compression", text: "Data Compression", videoFileName: "Data Compression"),
        ComputerWord(imageName: "DNS", text: "Domain Name System", videoFileName: "DNS")
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

                    ScrollView{
                        LazyVStack {
                            
                            
                            ForEach(searchResults) { computerWord in
                                ComputerWordRow(computerWord: computerWord) {
                                    selectedVideoFileName = computerWord.videoFileName
                                    isShowingVideoPlayer = true
                                }
                                        
                                    } .popoverTip(searchTip)
                                      .onTapGesture {
                                    searchTip.invalidate(reason: .actionPerformed)
                                
                            }
                            
                            
                        }}
                    .searchable(text: $searchText, prompt: "What word do you want to learn?")
                    .listStyle(InsetGroupedListStyle())
                    .navigationBarTitle("Computer", displayMode: .large)
                    .navigationBarBackButtonHidden(false)
                    .navigationBarTitleDisplayMode(.automatic)
                    .sheet(isPresented: $isShowingVideoPlayer) {
                        VideoPlayerView(videoFileName: selectedVideoFileName)
                    }

                }
                
            }

        }


    }

    var searchResults: [ComputerWord] {
        if searchText.isEmpty {
            return words
        } else {
            return words.filter { $0.text.lowercased().contains(searchText.lowercased()) }
        }
    }
}




struct ComputerV_Previews: PreviewProvider {
    static var previews: some View {
        ComputerV()
    }
}
