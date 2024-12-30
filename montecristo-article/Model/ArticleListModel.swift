//
//  ArticleListModel.swift
//  montecristo-article
//
//  Created by Henrique Delgado on 17/12/24.
//

import Foundation
import SwiftUI

@Observable
class ArticleListModel {
    var articles: [Article] = Article.preview()
    var selectedItems: Set<Article.ID> = []
    var editingMode = EditMode.inactive
    var shouldPresentCreateSheet = false

    func deleteButtonPressed() {
        withAnimation {
            for article in selectedItems {
                if let index = articles.firstIndex(where: { $0.id == article }) {
                    articles.remove(at: index)
                }
            }
            
            selectedItems = Set<Article.ID>()
            editingMode = .inactive
        }
    }

    func createButtonPressed() {
        shouldPresentCreateSheet = true
    }

    func editButtonPressed() {
        print("Empty line")
        for article in articles {
            print("Article: \(article)")
        }

        editingMode = .active
    }

    func doneButtonPressed() {
        editingMode = .inactive
    }

    func articleBinding(for id: Array<Article>.Index) -> Binding<Article> {
        Binding {
            self.articles[id]
        } set: { newNote in
            self.articles[id] = newNote
        }

    }
}
