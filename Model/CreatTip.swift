//
//  CreatTip.swift
//  DefEd Academy
//
//  Created by Zinab Zooba on 11/08/1445 AH.
//

import Foundation
import TipKit

struct Start: Tip{
    

    var title: Text{
        Text("")
    }
    var message: Text? {
        Text("Tap any of these icons to start your learning adventure!")
    }
    var image: Image?{
        Image(systemName: "studentdesk")
            .symbolRenderingMode(.multicolor)
       
    }
    
}

import Foundation
import TipKit

struct SearchTip: Tip{

    var title: Text{
        Text("Search")

    }
    var message: Text? {
        Text("Scaroll down to show the search bar")
    }
    var image: Image?{
        Image(systemName:  "sparkle.magnifyingglass")
            .symbolRenderingMode(.multicolor)


    }
    var options: [Option] {
        // Show this tip once.
        SearchTip.MaxDisplayCount(1)
    }

        
}
