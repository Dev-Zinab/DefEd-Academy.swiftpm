//
//  CourseV.swift
//  DefEd Academy
//
//  Created by Zinab Zooba on 11/08/1445 AH.
//

import SwiftUI
import TipKit


struct CoursesV: View {
    var body: some View {
        let start = Start()
        
        NavigationStack {
            
            
            
            ZStack{
                Color("bg")
                    .ignoresSafeArea()
                
                VStack {
                    
                    
                    
                    Spacer()
                    
                    
                    Text("Explore and Enjoy Learning!")
                        .foregroundColor(Color(.text))
                        .fontWeight(.bold)
                        .font(.title)
                    
                    
                    
                    Spacer()
                    
                    
                    HStack {
                        
                        Spacer()
                        
                        NavigationLink(destination: BiologyV()) {
                            Panner (imageName:"BIO"  , text: "Biology")
                            
                        }
                        Spacer()
                        NavigationLink(destination: ComputerV()) {
                            Panner (imageName:"Computer"  , text: "Computer")
                        }
                        Spacer()
                        NavigationLink(destination: MathV()) {
                            Panner (imageName:"Math"  , text: "Math")
                            
                        }
                        
                        Spacer()
                        
                        
                    }
                    .popoverTip(start, arrowEdge: .top)
                    
                    
                    
                    Spacer()
                    
                    
                    Image(.girl)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 170)
                    
                    
                }}.navigationBarTitle("DefEd Academy", displayMode: .automatic)
                .navigationBarItems(trailing:
                    NavigationLink(destination: AppInfo()) {
                    Image(systemName: "info.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(.main))
                }
                .isDetailLink(false)


                
                                    )}
        
    }
    
    
    
    
    struct Panner : View {
        let imageName: String
        let text: String
        var body: some View {
            VStack{
                ZStack {
                    HStack {
                        Image(imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                    }
                    
                }                .frame(width: 77, height: 77)
                    .background(Color(.main))
                    .cornerRadius(8.5)
                
                
                Text (text)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.28))
                
                
                
                
            }
        }
    }}
