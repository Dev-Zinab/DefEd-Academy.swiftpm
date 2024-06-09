//
//  ViewControler.swift
//  DefEd Academy
//
//  Created by Zinab Zooba on 11/08/1445 AH.
//

import UIKit
import SwiftUI

protocol SearchableWord: Identifiable {
    var imageName: String { get }
    var text: String { get }
    var videoFileName: String { get }
}

struct SearchableViewController<T: SearchableWord>: UIViewControllerRepresentable {

    var words: [T]

    class Coordinator: NSObject, UISearchResultsUpdating {
        var parent: SearchableViewController

        init(parent: SearchableViewController) {
            self.parent = parent
        }

        func updateSearchResults(for searchController: UISearchController) {
            parent.searchText = searchController.searchBar.text ?? ""
        }
    }

    @Binding var searchText: String

    init(words: [T], searchText: Binding<String>) {
        self.words = words
        self._searchText = searchText
    }
    

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = context.coordinator
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "What word you want to learn?"

        viewController.navigationItem.searchController = searchController
        viewController.definesPresentationContext = true


        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
}
