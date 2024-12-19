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
        for article in selectedItems {
            if let index = articles.lastIndex(where: { $0.id == article }) {
                articles.remove(at: index)
            }
            selectedItems = Set<Article.ID>()
        }
    }

    func createButtonPressed() {
        shouldPresentCreateSheet = true
    }

    func editButtonPressed() {
        editingMode = .active
    }

    func doneButtonPressed() {
        editingMode = .inactive
    }

}
